local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

lsp.configure("denols", {
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})
