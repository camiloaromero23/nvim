local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

lspconfig.astro.setup {
  init_options = {
    configuration = {},
    typescript = {
      serverPath = "/usr/local/lib/node_modules/typescript/lib/typescript.js",
    },
  },
  filetypes = { "astro" },
  cmd = { "astro-ls", "--stdio" },
  capabilities = custom_nvim.lsp.capabilities,
}
