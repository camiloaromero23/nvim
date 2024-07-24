vim.cmd.colorscheme "catppuccin-mocha" -- can be mocha, frappe, macchiato or only catppuccin

local mocha = require("catppuccin.palettes").get_palette "mocha"

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = mocha.blue })

vim.api.nvim_set_hl(0, "DiagnosticFloatingTextError", { fg = mocha.red, italic = true })
vim.api.nvim_set_hl(0, "DiagnosticFloatingTextWarn", { fg = mocha.yellow, italic = true })
vim.api.nvim_set_hl(0, "DiagnosticFloatingTextInfo", { fg = mocha.sky, italic = true })
vim.api.nvim_set_hl(0, "DiagnosticFloatingTextHint", { fg = mocha.mauve, italic = true })
vim.api.nvim_set_hl(0, "DiagnosticFloatingTextOk", { fg = mocha.green, italic = true })

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = mocha.red, italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = mocha.yellow, italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = mocha.sky, italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = mocha.mauve, italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { fg = mocha.green, italic = true })

vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = mocha.mauve, italic = true })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "LspDiagnosticsHint", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultHint", { fg = mocha.mauve })
vim.api.nvim_set_hl(0, "LspDiagnosticsVirtualTextHint", { fg = mocha.mauve, italic = true })

vim.api.nvim_set_hl(0, "FloatBorder", { fg = mocha.blue, bg = mocha.mantle })

vim.api.nvim_set_hl(0, "NavicText", { fg = mocha.text })

vim.api.nvim_set_hl(0, "PackageInfoUpToDateVersion", { fg = mocha.green, italic = true })
vim.api.nvim_set_hl(0, "PackageInfoOutdatedVersion", { fg = mocha.peach, italic = true })
