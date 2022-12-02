vim.api.nvim_create_user_command("ToggleDarkPlus", function()
  local colorscheme = vim.api.nvim_exec("colorscheme", true)

  if colorscheme == custom_nvim.colorscheme then
    vim.cmd.colorscheme "darkplus"
  else
    vim.cmd.colorscheme(custom_nvim.colorscheme)
  end
end, {})
