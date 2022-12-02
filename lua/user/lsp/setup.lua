local M = {}
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local capabilities = require("user.lsp.common").capabilities
local on_attach = require("user.lsp.common").on_attach

M.setup_handler = function(name, opts)
  local config = { capabilities = capabilities, on_attach = on_attach }

  if opts ~= nil then
    config = vim.tbl_deep_extend("keep", config, opts)
  end

  lspconfig[name].setup(config)
end
return M
