local theme = "user.theme." .. custom_nvim.colorscheme
local ok, _ = pcall(require, theme)

if not ok then
  vim.cmd.colorscheme(custom_nvim.colorscheme)
end
