return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      buftypes = { "*", "!lazy" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        -- mode = "virtualtext", -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = "lsp", -- Enable tailwind colors
        -- parsers can contain values used in |user_default_options|
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
        -- virtualtext = "■",
        -- update color values even if buffer is not focused
        -- example use: cmp_menu, cmp_docs
        always_update = true,
      },
    },
    event = "VeryLazy",
  },
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   event = "VeryLazy",
  --   opts = {
  --     ---Render style
  --     ---@usage 'background'|'foreground'|'virtual'
  --     render = "background",

  --     ---Set virtual symbol (requires render to be set to 'virtual')
  --     virtual_symbol = "■",
  --     -- virtual_symbol = "●",

  --     ---Set virtual symbol suffix (defaults to '')
  --     -- virtual_symbol_prefix = "",

  --     ---Set virtual symbol suffix (defaults to ' ')
  --     -- virtual_symbol_suffix = " ",

  --     ---Set virtual symbol position()
  --     ---@usage 'inline'|'eol'|'eow'
  --     ---inline mimics VS Code style
  --     ---eol stands for `end of column` - Recommended to set `virtual_symbol_suffix = ''` when used.
  --     ---eow stands for `end of word` - Recommended to set `virtual_symbol_prefix = ' ' and virtual_symbol_suffix = ''` when used.
  --     -- virtual_symbol_position = "inline",

  --     ---Highlight hex colors, e.g. '#FFFFFF'
  --     enable_hex = true,

  --     ---Highlight short hex colors e.g. '#fff'
  --     enable_short_hex = true,

  --     ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
  --     enable_rgb = true,

  --     ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
  --     enable_hsl = true,

  --     ---Highlight CSS variables, e.g. 'var(--testing-color)'
  --     enable_var_usage = true,

  --     ---Highlight named colors, e.g. 'green'
  --     enable_named_colors = true,

  --     ---Highlight tailwind colors, e.g. 'bg-blue-500'
  --     enable_tailwind = true,

  --     -- Exclude filetypes or buftypes from highlighting e.g. 'exclude_buftypes = {'text'}'
  --     exclude_filetypes = {},
  --     exclude_buftypes = { "lazy" },
  --   },
  -- },
}
