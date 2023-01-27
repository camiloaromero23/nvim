local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

-- local capabilities = require("user.lsp.common").capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.configure("cssls", {
  filetypes = { "css", "scss", "less" },
  cmd = { "vscode-css-language-server", "--stdio" },
  settings = {
    css = {
      validate = true,
    },
    less = {
      validate = true,
    },
    scss = {
      validate = true,
    },
  },
  single_file_support = true,
})
