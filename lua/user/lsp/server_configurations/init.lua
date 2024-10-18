require "user.lsp.server_configurations.angular"
require "user.lsp.server_configurations.astro"
require "user.lsp.server_configurations.biome"
require "user.lsp.server_configurations.cssls"
require "user.lsp.server_configurations.denols"
require "user.lsp.server_configurations.dockerls"
require "user.lsp.server_configurations.eslint"
require "user.lsp.server_configurations.gopls"
require "user.lsp.server_configurations.taplo"
require "user.lsp.server_configurations.jsonls"
require "user.lsp.server_configurations.lua_ls"
require "user.lsp.server_configurations.prismals"
require "user.lsp.server_configurations.pyright"
require "user.lsp.server_configurations.ruff_lsp"
require "user.lsp.server_configurations.sourcekit"
require "user.lsp.server_configurations.svelte"
require "user.lsp.server_configurations.tailwindcss"
if not custom_nvim.lsp.use_typescript_tools then
  require "user.lsp.server_configurations.ts_ls"
end
require "user.lsp.server_configurations.volar"
