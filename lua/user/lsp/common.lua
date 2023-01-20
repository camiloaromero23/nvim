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

local code_lens = function()
  vim.cmd [[hi link LspCodelens NONE]]
  vim.cmd [[hi LspCodelens guibg=None guifg=darkgray gui=bold]]
  vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
    group = augroups.codelens,
    pattern = "*",
    desc = "Refresh codelens",
    callback = function()
      pcall(vim.lsp.codelens.refresh)
    end,
  })
end

local attach_navic = function(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end
  navic.attach(client, bufnr)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    attach_navic(client, bufnr)
  end
  -- Code lens
  if client.server_capabilities.codeLensProvider then
    code_lens()
  end
  -- Disable lsp server formatting
  if client.name == "tsserver" then
    require("user.lsp.servers.tsserver").organize_imports()
    client.server_capabilities.document_formatting = false
    -- client.server_capabilities.semanticTokensProvider = nil
  end
  if client.name == "volar" then
    client.server_capabilities.document_formatting = false
  end
  if client.name == "sumneko_lua" then
    client.server_capabilities.document_formatting = false
  end
  -- Formatting
  if client.server_capabilities.documentFormattingProvider and custom_nvim.format_on_save.enable then
    custom_nvim.format_on_save.autocmd_id = vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroups.autoformat,
      pattern = "*",
      command = "lua vim.lsp.buf.format()",
    })
  end
  require("user.lsp.lsp_keymappings").set_lsp_keymaps(bufnr)
  lsp_highlight_document(bufnr, client)
end
return M
