return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        return
      end
      vim.g.skip_ts_context_commentstring_module = true

      ---@diagnostic disable-next-line: missing-fields
      configs.setup {
        auto_install = true,
        -- ensure_installed = "all",
        ensure_installed = {
          "astro",
          "css",
          "dockerfile",
          "git_rebase",
          "gitcommit",
          "gitignore",
          "go",
          "gomod",
          "gowork",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "json5",
          "jsonc",
          "latex",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "rust",
          "scheme",
          "scss",
          "sql",
          "svelte",
          "tsx",
          "typescript",
          "vimdoc",
          "vue",
        }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = {}, -- List of parsers to ignore installing
        highlight = {
          enable = true, -- false will disable the whole extension
          disable = { "" }, -- list of language that will be disabled
          additional_vim_regex_highlighting = true,
        },
        matchup = {
          enable = true, -- mandatory, false will disable the whole extension
          -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
        },
        indent = {
          enable = true,
          disable = { "yaml", "python" },
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
        },
      }
    end,
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
    },
    p = { "<cmd>InspectTree<cr>", "Open Treesitter Playground" },
    keys = {
      {
        "<leader>Tp",
        "<cmd>InspectTree<cr>",
        desc = "Open Treesitter Playground",
      },
    },
    event = "VeryLazy",
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require "rainbow-delimiters"

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
          tsx = "rainbow-parens",
        },
        highlight = {
          "RainbowDelimiterYellow",
          "RainbowDelimiterViolet",
          "RainbowDelimiterBlue",
        },
      }
    end,
    event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      throttle = true,
      max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
      trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
          "class",
          "function",
          "method",
          "for", -- These won't appear in the context
          "while",
          "if",
          "switch",
          "case",
        },
        tex = {
          "chapter",
          "section",
          "subsection",
          "subsubsection",
        },
        rust = {
          "impl_item",
          "struct",
          "enum",
        },
        scala = {
          "object_definition",
        },
        vhdl = {
          "process_statement",
          "architecture_body",
          "entity_declaration",
        },
        markdown = {
          "section",
        },
        elixir = {
          "anonymous_function",
          "arguments",
          "block",
          "do_block",
          "list",
          "map",
          "tuple",
          "quoted_content",
        },
        json = {
          "pair",
        },
        yaml = {
          "block_mapping_pair",
        },
      },
      exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
      },

      -- [!] The options below are exposed but shouldn't require your attention,
      --     you can safely ignore them.

      zindex = 20, -- The Z-index of the context window
      mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
    },
    event = "VeryLazy",
  },
  {
    "windwp/nvim-ts-autotag",
    opts = true,
    event = "VeryLazy",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup {
        enable = true,
        enable_autocmd = false,
        config = {
          -- Languages that have a single comment style
          typescript = "// %s",
          css = "/* %s */",
          scss = "/* %s */",
          html = "<!-- %s -->",
          svelte = "<!-- %s -->",
          vue = "<!-- %s -->",
          json = "",
        },
      }
    end,
    event = "BufReadPost",
  },
  {
    "Wansmer/treesj",
    opts = {
      use_default_keymaps = false,
    },
    keys = { { "<space>j", "<cmd>lua require('treesj').toggle()<cr>", desc = "Toggle Split Join" } },
    event = "VeryLazy",
  },
}
