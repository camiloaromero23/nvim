local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

lsp.configure("astro", {
  init_options = {
    configuration = {},
    typescript = {
      serverPath = "/usr/local/lib/node_modules/typescript/lib/typescript.js",
    },
  },
  filetypes = { "astro" },
  cmd = { "astro-ls", "--stdio" },
})
