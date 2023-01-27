local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

require("user.lsp.rust_tools").setup_rust_tools(lsp.capabilities,lsp.on_attach)
