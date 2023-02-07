local augroups = require "user.augroups"

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroups.general_settings,
  pattern = "*",
  desc = "Highlight text on yank",
  callback = function()
    vim.highlight.on_yank { higroup = "Search", timeout = 200 }
  end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = augroups.noNewLineComments,
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "qf",
    "help",
    "man",
    "floaterm",
    "lspinfo",
    "lir",
    "lsp-installer",
    "null-ls-info",
    "tsplayground",
    "DressingSelect",
    "Jaq",
  },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
    vim.opt_local.buflisted = false
  end,
  group = augroups.quickClose,
})

vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    local command = "! " .. "pkill -f " .. "prettierd"
    vim.cmd(command)
  end,
  group = augroups.closePrettier,
})
