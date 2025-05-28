local lsp_functions = require "config.lsp_functions"
return {
  {
    "dmmulroy/tsc.nvim",
    opts = {},
    event = "VeryLazy",
  },

  {
    "zapling/mason-conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "stevearc/conform.nvim",
    },
    opts = {
      ignore_install = {
        "rustfmt", -- Ignore this since it hast to be installed with rustup
      },
    },
    event = "VeryLazy",
  },

  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = {
        "K",
        lsp_functions.hover,
        desc = "Hover",
      }

      ---@class PluginLspOpts
      local ret = {
        -- options for vim.diagnostic.config()
        ---@type vim.diagnostic.Opts
        diagnostics = {
          underline = true,
          update_in_insert = true,
          virtual_text = {
            prefix = "",
          },
          severity_sort = true,
          title = false,
          float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = false,
            header = "",
            prefix = "",
            format = function(d)
              local code = d.code or (d.user_data and d.user_data.lsp.code)
              if code then
                local message, _ = string.format("%s [%s]", d.message, code):gsub("1. ", "")
                return message
              end
              return d.message
            end,
          },

          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
              [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
              [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
              [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
            },
            -- linehl = {
            --   [vim.diagnostic.severity.ERROR] = "DiagnosticError",
            --   [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
            --   [vim.diagnostic.severity.HINT] = "DiagnosticHint",
            --   [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            -- },
            numhl = {
              [vim.diagnostic.severity.ERROR] = "DiagnosticError",
              [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
              [vim.diagnostic.severity.HINT] = "DiagnosticHint",
              [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            },
          },
        },
        -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the inlay hints.
        inlay_hints = {
          enabled = true,
          exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
        },
        -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the code lenses.
        codelens = {
          enabled = false,
        },
        -- add any global capabilities here
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        -- options for vim.lsp.buf.format
        -- `bufnr` and `filter` is handled by the LazyVim formatter,
        -- but can be also overridden when specified
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        -- LSP Server Settings
        ---@type lspconfig.options
        servers = {
          cssls = {
            settings = {
              css = {
                validate = true,
                lint = {
                  unknownAtRules = "ignore",
                },
              },
              less = {
                validate = true,
                lint = {
                  unknownAtRules = "ignore",
                },
              },
              scss = {
                validate = true,
                lint = {
                  unknownAtRules = "ignore",
                },
              },
            },
            single_file_support = true,
          },
          lua_ls = {
            -- mason = false, -- set to false if you don't want this server to be installed with mason
            -- Use this to add any additional keymaps
            -- for specific lsp servers
            -- ---@type LazyKeysSpec[]
            -- keys = {},
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = "Replace",
                },
                doc = {
                  privateName = { "^_" },
                },
                hint = {
                  enable = true,
                },
                telemetry = {
                  enable = false,
                },
              },
            },
          },
          vtsls = {
            keys = {
              {
                "gD",
                function()
                  local params = vim.lsp.util.make_position_params()
                  LazyVim.lsp.execute {
                    command = "typescript.goToSourceDefinition",
                    arguments = { params.textDocument.uri, params.position },
                    open = true,
                  }
                end,
                desc = "Goto Source Definition",
              },
              {
                "gR",
                function()
                  LazyVim.lsp.execute {
                    command = "typescript.findAllFileReferences",
                    arguments = { vim.uri_from_bufnr(0) },
                    open = true,
                  }
                end,
                desc = "File References",
              },
              {
                "<leader>lo",
                LazyVim.lsp.action["source.organizeImports"],
                desc = "Organize Imports",
              },
              {
                "<leader>lv",
                function()
                  LazyVim.lsp.execute { command = "typescript.selectTypeScriptVersion" }
                end,
                desc = "Select TS workspace version",
              },
            },
            settings = {
              javascript = {
                inlayHints = {
                  enumMemberValues = { enabled = true },
                  functionLikeReturnTypes = { enabled = true },
                  parameterNames = { enabled = "all" },
                  parameterTypes = { enabled = true },
                  propertyDeclarationTypes = { enabled = true },
                  variableTypes = { enabled = true },
                },
              },
              typescript = {
                inlayHints = {
                  enumMemberValues = { enabled = true },
                  functionLikeReturnTypes = { enabled = true },
                  parameterNames = { enabled = "all" },
                  parameterTypes = { enabled = true },
                  propertyDeclarationTypes = { enabled = true },
                  variableTypes = { enabled = true },
                },
              },
            },
          },
        },
        -- you can do any additional lsp server setup here
        -- return true if you don't want this server to be setup with lspconfig
        ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
        setup = {
          -- example to setup with typescript.nvim
          -- tsserver = function(_, opts)
          --   require("typescript").setup({ server = opts })
          --   return true
          -- end,
          -- Specify * to use this function as a fallback for any server
          -- ["*"] = function(server, opts) end,
        },
      }
      return ret
    end,
  },
}
