local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

require "user.lsp.neodev"

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "custom_nvim" },
      },
      library = vim.api.nvim_get_runtime_file("", true),
      checkThirdParty = false,
      hint = { enable = true },
      telemetry = { enable = false },
    },
  },
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
  capabilities = custom_nvim.lsp.capabilities,
}
