vim.api.nvim_create_user_command("ToggleInlayHints", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

-- Add keymap to toggle inlay hints
vim.keymap.set("n", "<leader>th", "<cmd>ToggleInlayHints<CR>", { desc = "Toggle inlay hints" })
