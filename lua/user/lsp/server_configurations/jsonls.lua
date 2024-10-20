local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local schemastore_ok, schemastore = pcall(require, "schemastore")
if not schemastore_ok then
  return
end

custom_nvim.lsp.capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  },
  capabilities = custom_nvim.lsp.capabilities,
}
