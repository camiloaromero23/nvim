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
local lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
local conform_ok, mason_conform = pcall(require, "mason-conform")
if not mason_ok or not lspconfig_ok or not conform_ok then
  return
end

mason.setup()

mason_lspconfig.setup {
  ensure_installed = {
    "astro",
    "bashls",
    "biome",
    "cssls",
    "denols",
    "dockerls",
    "eslint",
    "gopls",
    "golangci_lint_ls",
    "jsonls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "ruff_lsp",
    "svelte",
    "tailwindcss",
    "taplo",
    "texlab",
    "ts_ls",
    "volar",
    "yamlls",
    "zk",
  },
}

mason_conform.setup {
  ignore_install = {
    "rustfmt", -- Ignore this since it hast to be installed with rustup
  },
}

require "user.lsp.server_configurations"
require "user.autocommands.inlay_hints"

require "user.lsp.diagnostics"
require "user.lsp.cmp"
