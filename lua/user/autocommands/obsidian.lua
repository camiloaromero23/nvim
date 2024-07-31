local augroups = require "user.augroups"

vim.api.nvim_create_autocmd({
  "BufReadPre",
  "BufNewFile",
}, {
  group = augroups.obsidian,
  pattern = vim.fn.expand "~" .. "/Documents/Obsidian/**.md",
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})
