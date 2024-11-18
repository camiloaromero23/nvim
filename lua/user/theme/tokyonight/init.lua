local colors = require("tokyonight.colors").setup()
vim.cmd.colorscheme "tokyonight-night"

vim.api.nvim_set_hl(0, "PackageInfoOutdatedVersion", { fg = colors.orange })
vim.api.nvim_set_hl(0, "PackageInfoUpToDateVersion", { fg = colors.green })

vim.api.nvim_set_hl(0, "SkActive", { bg = colors.magenta, fg = colors.fg_gutter, italic = false })
vim.api.nvim_set_hl(0, "SkInactive", { bg = colors.fg_gutter, fg = colors.magenta, italic = false })
