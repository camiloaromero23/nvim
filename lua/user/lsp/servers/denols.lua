local M = {}

M.setup = function()
  local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_ok then
    return
  end

  require("user.lsp.setup").setup_handler("denols", {
    root_dir = lspconfig.util.root_pattern "deno.json"
      or lspconfig.util.root_pattern "deno.jsonc"
  })
end

return M