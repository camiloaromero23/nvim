local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

lspconfig.tailwindcss.setup {
  root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "tailwind.js", "tailwind.cjs"),
  capabilities = custom_nvim.lsp.capabilities,
}
