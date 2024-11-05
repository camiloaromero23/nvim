return {
  -- LSP
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {
        "williamboman/mason.nvim",
        config = true,
        keys = {
          {
            "<leader>lI",
            "<cmd>Mason<cr>",
            desc = "Mason Info",
          },
        },
      },
      "williamboman/mason-lspconfig.nvim",
      "zapling/mason-conform.nvim",
      "b0o/schemastore.nvim",
      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", opts = {}, event = "User FileOpened" },
      -- LSP extensions
      "simrat39/rust-tools.nvim",
      {
        "pmizio/typescript-tools.nvim",
        keys = { { "<leader>lo", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" } },
      },
      "hrsh7th/cmp-nvim-lsp", -- Adds LSP completion capabilities
    },
    keys = {
      {
        "<leader>li",
        "<cmd>LspInfo<cr>",
        desc = "Info",
      },
    },
    event = "User FileOpened",
    config = function()
      local mason = require "mason"
      local mason_lspconfig = require "mason-lspconfig"
      local mason_conform = require "mason-conform"

      local icons = require "user.icons"


      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
      custom_nvim.lsp.capabilities = capabilities

      mason.setup()

      mason_conform.setup {
        ignore_install = {
          "rustfmt", -- Ignore this since it hast to be installed with rustup
        },
      }

      mason_lspconfig.setup {
        ensure_installed = {
          "astro",
          "bashls",
          "biome",
          "cssls",
          "css_variables",
          "denols",
          "dockerls",
          "eslint",
          "gopls",
          "golangci_lint_ls",
          "jsonls",
          "lua_ls",
          "pyright",
          "rust_analyzer",
          "ruff_lsp",
          "svelte",
          "tailwindcss",
          "taplo",
          "texlab",
          "ts_ls",
          "volar",
          "yamlls",
          "zk",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup {
              capabilities = custom_nvim.lsp.capabilities,
            }
          end,
          cssls = function()
            custom_nvim.lsp.capabilities.textDocument.completion.completionItem.snippetSupport = true

            require("lspconfig").cssls.setup {
              filetypes = { "css", "scss", "less" },
              cmd = { "vscode-css-language-server", "--stdio" },
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
              capabilities = custom_nvim.lsp.capabilities,
            }
          end,
          denols = function()
            local lspconfig = require "lspconfig"

            lspconfig.denols.setup {
              root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
              capabilities = custom_nvim.lsp.capabilities,
            }
          end,
          gopls = function()
            require("lspconfig").gopls.setup {
              settings = {
                gopls = {
                  completeUnimported = true,
                  usePlaceholders = true,
                  staticcheck = true,
                  hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                  },
                  analyses = {
                    unusedparams = true,
                    unreachable = true,
                  },
                },
              },
            }
          end,
          jsonls = function()
            local schemastore = require "schemastore"

            custom_nvim.lsp.capabilities.textDocument.completion.completionItem.snippetSupport = true

            require("lspconfig").jsonls.setup {
              settings = {
                json = {
                  schemas = schemastore.json.schemas(),
                  validate = { enable = true },
                },
              },
              capabilities = custom_nvim.lsp.capabilities,
            }
          end,
          lua_ls = function()
            require("lspconfig").lua_ls.setup {
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim", "custom_nvim" },
                  },
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                  hint = { enable = true },
                  telemetry = { enable = false },
                },
              },
              on_attach = function(client)
                client.server_capabilities.document_formatting = false
              end,
              capabilities = custom_nvim.lsp.capabilities,
            }
          end,
          rust_analyzer = function()
            local rust_tools = require "rust-tools"
            local mason_registry = require "mason-registry"

            local codelldb = mason_registry.get_package "codelldb"
            local extension_path = codelldb:get_install_path() .. "/extension/"
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

            rust_tools.setup {
              tools = {
                executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
                reload_workspace_from_cargo_toml = true,
                autoSetHints = true,
                runnables = {
                  use_telescope = true,
                },
                inlay_hints = {
                  auto = false,
                  only_current_line = false,
                  show_parameter_hints = true,
                  parameter_hints_prefix = "<-",
                  other_hints_prefix = "=>",
                  max_len_align = false,
                  max_len_align_padding = 1,
                  right_align = false,
                  right_align_padding = 7,
                  highlight = "Comment",
                },
                hover_actions = {
                  border = {
                    { "╭", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╮", "FloatBorder" },
                    { "│", "FloatBorder" },
                    { "╯", "FloatBorder" },
                    { "─", "FloatBorder" },
                    { "╰", "FloatBorder" },
                    { "│", "FloatBorder" },
                  },
                  auto_focus = true,
                },
              },
              server = {
                capabilities = custom_nvim.lsp.capabilities,
                standalone = false,
              },
              dap = {
                adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
              },
            }
          end,
          tailwindcss = function()
            require("lspconfig").tailwindcss.setup {
              capabilities = custom_nvim.lsp.capabilities,
              settings = {
                tailwindCSS = {
                  classAttributes = custom_nvim.lsp.tailwindcss_class_attributes,
                  experimental = {
                    classRegex = {
                      { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                      { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                      { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                    },
                  },
                  -- suggestions = false, -- This one is what makes it slow (needed for nvim-cmp)
                },
              },
            }
          end,
          ts_ls = function()
            if require("user.utils.lsp_functions").is_vue_project() then
              return
            end

            -- if require("user.lsp.utils").is_deno_project() then
            --   return
            -- end

            -- LSP settings (for overriding per client)
            local inlayHints = {
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            }

            local on_attach = function(client)
              client.server_capabilities.document_formatting = false
              client.server_capabilities.document_range_formatting = false
              -- client.server_capabilities.semanticTokensProvider = nil
            end

            if custom_nvim.lsp.use_typescript_tools then
              require("typescript-tools").setup {
                capabilities = custom_nvim.lsp.capabilities,
                on_attach = on_attach,
                settings = {
                  expose_as_code_action = "all",
                  tsserver_file_preferences = inlayHints,
                },
              }
              return
            end

            local lspconfig = require "lspconfig"

            lspconfig.ts_ls.setup {
              root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
              filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
              },
              cmd = { "typescript-language-server", "--stdio" },
              init_options = {
                preferences = inlayHints,
              },
              settings = {
                javascript = {
                  inlayHints = inlayHints,
                },
                typescript = {
                  inlayHints = inlayHints,
                },
              },
              on_attach = on_attach,
              capabilities = custom_nvim.lsp.capabilities,
            }
          end,
          volar = function()
            if not require("user.utils.lsp_functions").is_vue_project() then
              return
            end

            local inlayHints = {
              enumMemberValues = {
                enabled = true,
              },
              functionLikeReturnTypes = {
                enabled = false,
              },
              parameterNames = {
                enabled = "none",
                suppressWhenArgumentMatchesName = false,
              },
              parameterTypes = {
                enabled = true,
              },
              propertyDeclarationTypes = {
                enabled = true,
              },
              variableTypes = {
                enabled = true,
              },
            }

            require("lspconfig").volar.setup {
              init_options = {
                vue = {
                  hybridMode = false,
                },
              },
              settings = {
                typescript = {
                  inlayHints = inlayHints,
                },
                javascript = {
                  inlayHints = inlayHints,
                },
                vue = {
                  inlayHints = {
                    inlineHandlerLeading = true,
                    missingProps = true,
                    optionsWrapper = true,
                    vBindShorthand = true,
                  },
                },
              },
              on_attach = function(client)
                client.server_capabilities.document_formatting = false
              end,
              capabilities = custom_nvim.lsp.capabilities,
            }
          end,
        },
      }

      vim.lsp.inlay_hint.enable()

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
        close_events = { "BufHidden", "InsertLeave" },
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
      })

      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.BigInformation,
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
        float = {
          focusable = false,
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
        severity_sort = true,
        underline = true,
        update_in_insert = true,
        virtual_text = {
          prefix = "",
        },
        title = false,
      }

      vim.cmd.LspStart() -- Needed for lazy loading to work
    end,
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettierd" },
        css = { "prettierd" },
        go = { "gofumpt", "goimports-reviser" },
        graphql = { "prettierd" },
        handlebars = { "prettierd" },
        html = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        less = { "prettierd" },
        lua = { "stylua" },
        markdown = { "prettierd" },
        markdown_mdx = { "prettierd" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        scss = { "prettierd" },
        svelte = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        vue = { "prettierd" },
        yaml = { "prettierd" },
      },
      format_on_save = custom_nvim.format_on_save.enable and custom_nvim.format_on_save.opts or nil,
    },
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format {
            async = true,
            lsp_format = "fallback",
          }
        end,
        desc = "Format",
        mode = { "n", "v" },
      },
    },
  },
  {
    "saecki/crates.nvim",
    opts = {
      popup = {
        border = "rounded",
      },
      lsp = {
        enabled = true,
        -- on_attach = function(client, bufnr)
        --   -- the same on_attach function as for your other lsp's
        -- end,
        actions = true,
        completion = true,
        hover = true,
      },
    },

    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)

      vim.keymap.set("n", "<leader>Do", crates.show_popup, { desc = "Show popup", buffer = 0 })
      vim.keymap.set("n", "<leader>Dr", crates.reload, { desc = "Reload", buffer = 0 })
      vim.keymap.set("n", "<leader>Dv", crates.show_versions_popup, { desc = "Show Versions", buffer = 0 })
      vim.keymap.set("n", "<leader>Df", crates.show_features_popup, { desc = "Show Features", buffer = 0 })
      vim.keymap.set(
        "n",
        "<leader>Dd",
        crates.show_dependencies_popup,
        { desc = "Show Dependencies Popup", buffer = 0 }
      )
      vim.keymap.set("n", "<leader>Du", crates.update_crate, { desc = "Update Crate", buffer = 0 })
      vim.keymap.set("n", "<leader>Da", crates.update_all_crates, { desc = "Update All Crates", buffer = 0 })
      vim.keymap.set("n", "<leader>DU", crates.upgrade_crate, { desc = "Upgrade Crate", buffer = 0 })
      vim.keymap.set("n", "<leader>DH", crates.open_homepage, { desc = "Open Homepage", buffer = 0 })
      vim.keymap.set("n", "<leader>DR", crates.open_repository, { desc = "Open Repository", buffer = 0 })
      vim.keymap.set("n", "<leader>DD", crates.open_documentation, { desc = "Open Documentation", buffer = 0 })
      vim.keymap.set("n", "<leader>DC", crates.open_crates_io, { desc = "Open Crate.io", buffer = 0 })
    end,
    lazy = true,
    event = "BufRead Cargo.toml",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "vuki656/package-info.nvim",
    opts = {
      icons = {
        enable = true, -- Whether to display icons
        style = {
          up_to_date = "|  ", -- Icon for up to date dependencies
          outdated = "|  ", -- Icon for outdated dependencies
        },
      },
      autostart = true, -- Whether to autostart when `package.json` is opened
      hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
      hide_unstable_versions = true, -- It hides unstable versions from version list e.g next-11.1.3-canary3
      -- Can be `npm`, `yarn`, or `pnpm`. Used for `delete`, `install` etc...
      -- The plugin will try to auto-detect the package manager based on
      -- `yarn.lock` or `package-lock.json`. If none are found it will use the
      -- provided one, if nothing is provided it will use `yarn`
      package_manager = "pnpm",
    },

    config = function(_, opts)
      local package_info = require "package-info"
      package_info.setup(opts)

      vim.keymap.set("n", "<leader>Dt", package_info.toggle, { desc = "Toggle dependency versions", buffer = 0 })
      vim.keymap.set("n", "<leader>Du", package_info.update, { desc = "Update dependency on the line", buffer = 0 })
      vim.keymap.set("n", "<leader>Dd", package_info.delete, { desc = "Delete dependency on the line", buffer = 0 })
      vim.keymap.set("n", "<leader>Di", package_info.install, { desc = "Install a new dependency", buffer = 0 })
      vim.keymap.set(
        "n",
        "<leader>Dp",
        package_info.change_version,
        { desc = "Install a different dependency version", buffer = 0 }
      )

      local telescope_ok, telescope = pcall(require, "telescope")

      if telescope_ok then
        pcall(telescope.load_extension, "package_info")
      end
    end,
    event = "BufRead package.json",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-telescope/telescope.nvim" },
  },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Autocompletion
      "onsails/lspkind-nvim", -- Completion icons
      "hrsh7th/cmp-buffer", -- Buffer completion
      "hrsh7th/cmp-path", -- Path completion
      -- "hrsh7th/cmp-nvim-lua", -- Lua completion

      "saadparwaiz1/cmp_luasnip", -- Snippet Engine & its associated nvim-cmp source

      "hrsh7th/cmp-nvim-lsp", -- Adds LSP completion capabilities

      {
        "L3MON4D3/LuaSnip",
        build = (function()
          return "make install_jsregexp"
        end)(),
        config = function()
          require("luasnip/loaders/from_vscode").lazy_load()
        end,
      },
      "rafamadriz/friendly-snippets", -- Adds a number of user-friendly snippets
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local lspkind = require "lspkind"

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-1),
          ["<C-f>"] = cmp.mapping.scroll_docs(1),
          ["<C-Space>"] = cmp.mapping.complete {},
          ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          },
          -- Accept currently selected item. If none selected, `select` first item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ["<CR>"] = cmp.mapping.confirm { select = false, behavior = cmp.ConfirmBehavior.Replace },
          ["<Tab>"] = cmp.mapping(function(fallback)
            -- if cmp.visible() then
            --   cmp.select_next_item()
            if luasnip.expandable() then
              luasnip.expand {}
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            -- elseif check_backspace() then
            --   fallback()
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            -- if cmp.visible() then
            --   cmp.select_prev_item()
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          expandable_indicator = true,
          format = function(entry, vim_item)
            local kind = lspkind.cmp_format {
              mode = "symbol_text",
              maxwidth = 50,
              preset = "codicons",
            }(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = strings[1] or ""
            kind.menu = "    " .. (strings[2] or "")

            -- return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item) -- Enable this when plugin loads custom colors
            return kind
          end,
        },
        sources = {
          {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        window = {
          completion = cmp.config.window.bordered {
            winhighlight = "FloatBorder:Normal,NormalFloat:Normal",
          },
          documentation = cmp.config.window.bordered {
            winhighlight = "FloatBorder:Normal,NormalFloat:Normal",
          },
        },
        view = {
          natives = true,
        },
        experimental = {
          -- ghost_text = { hl_group = "Comment" },
          ghost_text = false,
        },
      }

      cmp.setup.filetype({
        "sql",
      }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })
    end,
  },
  -- {
  --   "saghen/blink.cmp",
  --   event = "InsertEnter",
  --   -- optional: provides snippets for the snippet source
  --   dependencies = "rafamadriz/friendly-snippets",
  --   build = "cargo build --release",

  --   -- version = "v0.*",
  --   ---@module 'blink.cmp'
  --   ---@type blink.cmp.Config
  --   opts = {
  --     sources = {
  --       providers = {
  --         { "blink.cmp.sources.lsp", name = "LSP", score_offset = 1 },
  --         { "blink.cmp.sources.path", name = "Path", score_offset = -3 },
  --         { "blink.cmp.sources.snippets", name = "Snippets", score_offset = -3 },
  --         { "blink.cmp.sources.buffer", name = "Buffer", fallback_for = { "LSP" } },
  --       },
  --     },
  --     highlight = {
  --       use_nvim_cmp_as_default = true,
  --     },
  --     nerd_font_variant = "normal",

  --     -- experimental auto-brackets support
  --     accept = {
  --       auto_brackets = {
  --         enabled = true,
  --       },
  --     },

  --     -- experimental signature help support
  --     trigger = {
  --       signature_help = {
  --         enabled = true,
  --       },
  --     },
  --     keymap = {
  --       accept = "<CR>",
  --       select_next = { "<C-j>", "<Down>" },
  --       select_prev = { "<C-k>", "<Up>" },
  --     },
  --     windows = {
  --       autocomplete = {
  --         border = "rounded",
  --         selection = "manual",
  --         ---@param ctx blink.cmp.CompletionRenderContext
  --         --- @return blink.cmp.Component[]
  --         draw = function(ctx)
  --           return {
  --             " ",
  --             { ctx.kind_icon, ctx.icon_gap, hl_group = "BlinkCmpKind" .. ctx.kind },
  --             {
  --               ctx.label,
  --               ctx.kind == "Snippet" and "~" or nil,
  --               fill = true,
  --               hl_group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
  --               max_width = 50,
  --             },
  --             {
  --               ctx.icon_gap,
  --               ctx.kind,
  --             },
  --             " ",
  --           }
  --         end,
  --       },
  --       -- signature_help = {
  --       --   border = "rounded",
  --       -- },
  --       documentation = {
  --         border = "rounded",
  --       },
  --     },
  --   },
  -- },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        -- Load the wezterm types when the `wezterm` module is required
        -- Needs `justinsgithub/wezterm-types` to be installed
        -- { path = "wezterm-types", mods = { "wezterm" } },
      },
    },
    -- dependencies = {
    --   "justinsgithub/wezterm-types",
    -- }
  },
  {
    "Bilal2453/luvit-meta",
    lazy = true,
  }, -- optional `vim.uv` typings
  {
    "ray-x/lsp_signature.nvim",
    config = true,
    event = "InsertEnter",
  },
  {
    "dmmulroy/tsc.nvim",
    opts = {},
    event = "User FileOpened",
  },
}
