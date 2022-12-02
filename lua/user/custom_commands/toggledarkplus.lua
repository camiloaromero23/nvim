vim.api.nvim_create_user_command("ToggleDarkPlus", function()
  local colorscheme = vim.api.nvim_exec("colorscheme", true)

  if colorscheme == "material" then
    vim.cmd [[colorscheme darkplus]]
    return
  end
  vim.cmd [[colorscheme material]]
end, {})
