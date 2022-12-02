local M = {}
local augroups = require "user.augroups"

local function lsp_highlight_document(bufnr, client)
  -- Set autocommands conditional on server_capabilities
  local status_ok, highlight_supported = pcall(function()
    return client.supports_method "textDocument/documentHighlight"
  end)
  if not status_ok or not highlight_supported then
    return
  end
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = augroups.lspDocumentHighlight,
    buffer = bufnr,
    callback = vim.lsp.buf.document_highlight,
  })
  vim.api.nvim_create_autocmd("CursorMoved", {
    group = augroups.lspDocumentHighlight,
    buffer = bufnr,
    callback = vim.lsp.buf.clear_references,
  })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.on_attach = function(client, bufnr)
  M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

  -- Formatting
  if client.server_capabilities.documentFormattingProvider and custom_nvim.format_on_save then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroups.autoformat,
      pattern = "*",
      command = "lua vim.lsp.buf.formatting_sync()",
    })
  end
  require("user.lsp.lsp_keymappings").set_lsp_keymaps(bufnr)
  lsp_highlight_document(bufnr, client)
end
return M
