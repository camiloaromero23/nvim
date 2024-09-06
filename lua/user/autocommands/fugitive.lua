local augroups = require "user.augroups"

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = augroups.fugitive,
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()

    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git "push"
    end, { buffer = bufnr, remap = false, desc = "Fugitive Git Push" })

    -- rebase always
    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git "pull --rebase"
    end, { buffer = bufnr, remap = false, desc = "Fugitive Git Pull" })
  end,
})
