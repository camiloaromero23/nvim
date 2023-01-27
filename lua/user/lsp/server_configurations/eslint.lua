local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

local filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "vue",
}

lsp.configure("eslint", {
  filetypes = filetypes,
  cmd = { "vscode-eslint-language-server", "--stdio" },
})
