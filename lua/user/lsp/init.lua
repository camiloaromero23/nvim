vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "single",
  close_events = { "BufHidden", "InsertLeave" },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "single",
})
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
custom_nvim.lsp.capabilities = capabilities

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  return
end

mason.setup()

mason_lspconfig.setup {
  ensure_installed = {
    "astro",
    "cssls",
    "denols",
    "eslint",
    "gopls",
    "jsonls",
    "lua_ls",
    "svelte",
    "tailwindcss",
    "tsserver",
    "volar",
  },
}

require "user.lsp.server_configurations"
require "user.autocommands.inlay_hints"

require "user.lsp.diagnostics"
require "user.lsp.cmp"
