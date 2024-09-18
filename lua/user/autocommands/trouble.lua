local augroups = require "user.augroups"

vim.api.nvim_create_autocmd("BufRead", {
  group = augroups.trouble,
  callback = function(ev)
    local buftype = vim.bo[ev.buf].buftype

    if buftype == "quickfix" then
      vim.schedule(function()
        vim.cmd.cclose()
        vim.cmd.Trouble "qflist open"
      end)
      return
    end

    if buftype == "loclist" then
      vim.schedule(function()
        vim.cmd.lclose()
        vim.cmd.Trouble "loclist open"
      end)
    end
  end,
})
