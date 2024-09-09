local augroups = require "user.augroups"

vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
  group = augroups.fileOpened,
  once = true,
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
    if not (vim.fn.expand "%" == "" or buftype == "nofile") then
      vim.cmd "do User FileOpened"
      require "user.lsp"
      vim.cmd "LspStart"
      vim.cmd "ColorizerAttachToBuffer"
    end
  end,
})

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
    "tsplayground",
    "DressingSelect",
    "Jaq",
    "fugitive",
  },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
    vim.opt_local.buflisted = false
  end,
  group = augroups.quickClose,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
  group = augroups.envFiles,
  pattern = ".env.*",
  callback = function()
    vim.cmd [[set filetype=sh]]
  end,
})
