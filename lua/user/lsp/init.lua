require "user.lsp.configs"
require "user.lua_dev"
require "user.lsp.mason"

local configured_servers = {
  "astro",
  "cssls",
  "denols",
  "eslint",
  "gopls",
  "jsonls",
  "sumneko_lua",
  "tailwindcss",
  "tsserver",
  "volar",
}

for _, server in pairs(configured_servers) do
  require("user.lsp.servers." .. server).setup()
end

-- require("user.lsp.setup").setup_handler "golangci_lint_ls"
