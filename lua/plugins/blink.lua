return {
  "saghen/blink.cmp",
  version = "*",

  opts = {
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
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
        -- auto_show = function(ctx)
        --   return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
        -- end,
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
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if string.find(ctx.label:lower(), "transparent") ~= nil and ctx.kind == "Color" then
                  hl = "ColorTransparent"
                end
                return { { group = hl } }
              end,
            },
            kind = {
              highlight = "",
            },
          },
        },
      },
    },
    -- signature = {
    --   enabled = true,
    --   window = {
    --     border = "rounded",
    --   },
    -- },
    --
    cmdline = {
      enabled = true,
      keymap = {
        -- preset = "inherit",
        ["<C-k>"] = { "show", "select_prev", "fallback" },
        ["<C-j>"] = { "show", "select_next", "fallback" },
        ["<CR>"] = { "fallback" },
      },
      completion = {
        ghost_text = {
          enabled = true,
        },
      },
    },

    keymap = {
      preset = "default",
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      -- ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },

      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
    },
  },
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "onsails/lspkind-nvim",
      opts = {
        mode = "symbol",
        preset = "codicons",
      },
    },
  },
}
