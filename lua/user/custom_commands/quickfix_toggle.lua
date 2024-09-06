vim.api.nvim_create_user_command("QuickFixToggle", function()
  if vim.tbl_isempty(vim.fn.filter(vim.fn.getwininfo(), function(_, wininfo)
    return wininfo.quickfix
  end)) then
    vim.cmd "copen"
  else
    vim.cmd "cclose"
  end
end, { desc = "Toggle QuickFix list" })
