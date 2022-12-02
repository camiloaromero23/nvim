local augroups = require "user.augroups"

vim.api.nvim_create_user_command("ToggleFormatOnSave", function()
  if custom_nvim.format_on_save.enable and custom_nvim.format_on_save.autocmd_id ~= -1 then
    vim.api.nvim_del_autocmd(custom_nvim.format_on_save.autocmd_id)
    custom_nvim.format_on_save.autocmd_id = -1
  else
    custom_nvim.format_on_save.autocmd_id = vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroups.autoformat,
      pattern = "*",
      command = "lua vim.lsp.buf.format()",
    })
  end
  custom_nvim.format_on_save.enable = not custom_nvim.format_on_save.enable
end, {})
