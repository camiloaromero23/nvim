local M = {}
M.setup = function()
  local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_ok then
    return
  end

  require("user.lsp.setup").setup_handler("tailwindcss", {
    root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "tailwind.js", "tailwind.cjs"),
  })
end

return M
