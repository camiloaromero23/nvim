local lsp_functions = require "config.lsp_functions"
return {
  {
    "zapling/mason-conform.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "stevearc/conform.nvim",
    },
    opts = {
      ignore_install = {
        "rustfmt", -- Ignore this since it hast to be installed with rustup
      },
    },
    event = "VeryLazy",
  },

  -- Custom keymaps for LSP
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      servers = {
        ["*"] = {
          keys = {
            { "K", lsp_functions.hover, desc = "Hover" },
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },
    ---@class PluginLspOpts
    opts = {
      inlay_hints = {
        enabled = true,
        exclude = {},
      },
      codelens = {
        enabled = false,
      },
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
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
        ts_ls = {
          enabled = false,
        },
        denols = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")(fname)
          end,
        },
        vtsls = {
          keys = {
            {
              "gD",
              function()
                local params = vim.lsp.util.make_position_params(0, "utf-8")
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
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                maxInlayHintLength = 30,
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
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
        ["*"] = {
          capabilities = {
            workspace = {
              fileOperations = {
                didRename = true,
                willRename = true,
              },
            },
          },
        },
      },
      setup = {
        -- example to setup with typescript.nvim
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
}
