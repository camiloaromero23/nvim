vim.api.nvim_create_user_command("ToggleInlayHints", function()
  vim.lsp.buf.inlay_hint(0, nil)
end, {})
