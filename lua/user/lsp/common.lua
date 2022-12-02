local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.on_attach = function(client, bufnr)
  M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

  -- Formatting
  if client.server_capabilities.documentFormattingProvider and custom_nvim.format_on_save then
    local autoformat_group = vim.api.nvim_create_augroup("AutoFormat", { clear = true });
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = autoformat_group,
      pattern = "*",
      command = "lua vim.lsp.buf.formatting_sync()"
    })
  end
  require("user.lsp.lsp_keymappings").set_lsp_keymaps(bufnr)
end
return M
