local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "vue",
}

lspconfig.eslint.setup {
  filetypes = filetypes,
  cmd = { "vscode-eslint-language-server", "--stdio" },
  capabilities = custom_nvim.lsp.capabilities,
}
