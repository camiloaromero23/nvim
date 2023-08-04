local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

lspconfig.gopls.setup {
  single_file_support = true,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  cmd = { "gopls" },
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
  capabilities = custom_nvim.lsp.capabilities,
}
