return {
  {
    "saghen/blink.cmp",

    dependencies = {
      {
        "onsails/lspkind-nvim",
        opts = {
          mode = "symbol",
          preset = "codicons",
        },
      },
      "rafamadriz/friendly-snippets",
    },
    version = "*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = {
            border = "rounded",
          },
        },
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
          end,
          border = "rounded",
          draw = {
            align_to = "none",
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
            treesitter = {},
            components = {
              kind_icon = {
                ellipsis = false,
                text = function(ctx)
                  if ctx.kind == "Color" then
                    return ""
                  end

                  return require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                    preset = "codicons",
                  })
                end,
              },
              kind = {
                highlight = "",
              },
            },
          },
        },

        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
      },
      keymap = {
        preset = "default",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },

        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      sources = {
        default = { "lazydev", "lsp", "dadbod", "path", "snippets", "buffer" },
        providers = {
          lsp = {
            score_offset = 1,
            fallbacks = {
              "buffer",
            },
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          dadbod = {
            name = "Dadbod",
            module = "vim_dadbod_completion.blink",
          },
          path = {
            score_offset = -3,
          },
          snippets = {
            score_offset = -3,
          },
          buffer = {
            score_offset = 1,
          },
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },
    },
  },
}
