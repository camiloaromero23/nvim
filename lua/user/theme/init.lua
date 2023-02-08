local theme = "user.theme." .. custom_nvim.colorscheme
local ok, _ = pcall(require, theme)

if not ok then
  vim.cmd.colorscheme(custom_nvim.colorscheme)
end
vim.cmd [[hi DashboardLogo guifg=#158DA2]]
