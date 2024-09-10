local augroups = require "user.augroups"

vim.api.nvim_create_autocmd({
  "FileType",
}, {
  group = augroups.verticalHelp,
  pattern = "help",
  callback = function()
    vim.bo.bufhidden = "unload"
    vim.cmd.wincmd "L"
    vim.cmd.wincmd "="
  end,
})
