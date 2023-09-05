local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

lspconfig.pyright.setup {
  capabilities = custom_nvim.lsp.capabilities,
}

