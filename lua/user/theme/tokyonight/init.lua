local colors = require("tokyonight.colors").setup()
vim.cmd.colorscheme "tokyonight-night"

vim.api.nvim_set_hl(0, "PackageInfoOutdatedVersion", { fg = colors.orange })
vim.api.nvim_set_hl(0, "PackageInfoUpToDateVersion", { fg = colors.green })
