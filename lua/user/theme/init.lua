local theme = "user.theme." .. custom_nvim.colorscheme
local ok, _ = pcall(require, theme)

if not ok then
  vim.cmd.colorscheme(custom_nvim.colorscheme)
  vim.api.nvim_set_hl(0, "DashboardLogo", { fg = "#158DA2" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#dbb671" })
  vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#bb70d2" })
  vim.api.nvim_set_hl(0, "PackageInfoOutdatedVersion", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "PackageInfoUpToDateVersion", { fg = "#8FB573" })
end

vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "gray" })
