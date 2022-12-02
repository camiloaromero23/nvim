local ok, material = pcall(require, "material")

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
  italics = {
    comments = true,
    keywords = true,
    tags = true,
    functions = true,
    variables = false,
    strings = false,
  },
  custom_colors = { accent = "#ADD8E6" },
  disable = {
    colored_cursor = true,
    eob_lines = true,
  },
  async_loading = true,
}

vim.g.material_style = "darker"
vim.cmd "colorscheme material"
