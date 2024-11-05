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
      -- Useful status updates for LSP
      { "j-hui/fidget.nvim", opts = {}, event = "User FileOpened" },
    },
    keys = {
      {
        "<leader>li",
        "<cmd>LspInfo<cr>",
        desc = "Info",
      },
    },
    lazy = true,
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
  -- LSP extensions
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require "user.lsp.server_configurations.rust_analyzer"
    end,
    ft = { "rust", "rs", "toml" },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      if require("user.lsp.utils").is_vue_project() then
        return
      end

      require("typescript-tools").setup {
        capabilities = custom_nvim.lsp.capabilities,
        on_attach = function(client)
          client.server_capabilities.document_formatting = false
          client.server_capabilities.document_range_formatting = false
          -- client.server_capabilities.semanticTokensProvider = nil
        end,
        settings = {
          expose_as_code_action = "all",
          tsserver_file_preferences = {
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      }
    end,
    cond = custom_nvim.lsp.use_typescript_tools,
    keys = {
      {
        "<leader>lo",
        "<cmd>TSToolsOrganizeImports<cr>",
        desc = "Organize Imports",
      },
    },
    event = "User FileOpened",
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
