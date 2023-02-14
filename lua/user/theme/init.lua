local theme = "user.theme." .. custom_nvim.colorscheme
local ok, _ = pcall(require, theme)

if not ok then
  vim.cmd.colorscheme(custom_nvim.colorscheme)
end
vim.api.nvim_set_hl(0, "DashboardLogo", { fg = "#158DA2" })
vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "gray" })
