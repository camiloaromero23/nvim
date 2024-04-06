if not require("user.lsp.utils").is_vue_project() then
  return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

lspconfig.volar.setup {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
  capabilities = custom_nvim.lsp.capabilities,
}
