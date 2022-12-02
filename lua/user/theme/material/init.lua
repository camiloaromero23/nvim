local ok, material = pcall(require, "material")
local custom_highlights = require "user.theme.material.custom_highlights"

if not ok then
  return
end

material.setup {
  contrast = {
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    line_numbers = false, -- Enable contrast background for line numbers
    sign_column = false, -- Enable contrast background for the sign column
    cursor_line = true, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    popup_menu = false, -- Enable lighter background for the popup menu
  },
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    tags = { italic = true },
    functions = { italic = true },
    -- variables = false,
    -- strings = false,
  },
  plugins = { -- Uncomment the plugins that you use to highlight them
    -- Available plugins:
    -- "dap",
    "dashboard",
    "gitsigns",
    -- "hop",
    "indent-blankline",
    -- "lspsaga",
    -- "mini",
    -- "neogit",
    "nvim-cmp",
    "nvim-navic",
    "nvim-tree",
    -- "sneak",
    "telescope",
    -- "trouble",
    "which-key",
  },
  custom_colors = function(colors)
    colors.editor.accent = "#ADD8E6"
  end,
  disable = {
    colored_cursor = true,
    eob_lines = true,
  },
  async_loading = true,
  custom_highlights = custom_highlights,
}

vim.g.material_style = "darker"
vim.cmd.colorscheme "material"
