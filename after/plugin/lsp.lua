local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
  return
end

lsp.preset "lsp-compe"

-- lsp.ensure_installed {
--   "astro",
--   "cssls",
--   "denols",
--   "eslint",
--   "gopls",
--   "jsonls",
--   "sumneko_lua",
--   "svelte",
--   "tailwindcss",
--   "tsserver",
--   "volar",
-- }

require "user.lsp.server_configurations"

lsp.setup()
require "user.lsp.diagnostics"
