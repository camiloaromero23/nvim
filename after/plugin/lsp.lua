local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
  return
end

local lsp_common = require "user.lsp.common"
local augroups = require "user.augroups"

lsp.preset "lsp-compe"

lsp.ensure_installed {
  "astro",
  "cssls",
  "denols",
  "eslint",
  "gopls",
  "jsonls",
  "sumneko_lua",
  "svelte",
  "tailwindcss",
  "tsserver",
  "volar",
}

require "user.lsp.server_configurations"

lsp.on_attach(function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    lsp_common.attach_navic(client, bufnr)
  end
  -- Code lens
  if client.server_capabilities.codeLensProvider then
    lsp_common.code_lens()
  end
  -- Formatting
  if client.server_capabilities.documentFormattingProvider and custom_nvim.format_on_save.enable then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroups.autoformat,
      pattern = "*",
      command = "lua vim.lsp.buf.format()",
    })
  end
  require("user.lsp.lsp_keymappings").set_lsp_keymaps(bufnr)
  lsp_common.lsp_highlight_document(bufnr, client)
end)

lsp.setup()
require "user.lsp.diagnostics"
