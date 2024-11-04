local M = {}
local augroups = require "user.augroups"

M.code_lens = function()
  vim.api.nvim_set_hl(0, "LspCodelens", { fg = "darkgray", bold = true })
  vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    group = augroups.codelens,
    pattern = "*",
    desc = "Refresh codelens",
    callback = function()
      pcall(vim.lsp.codelens.refresh)
    end,
  })
end

M.attach_navic = function(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end
  navic.attach(client, bufnr)
end

return M
