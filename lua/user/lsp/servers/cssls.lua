local M = {}

M.setup = function()
  local capabilities = require("user.lsp.common").capabilities
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require("user.lsp.setup").setup_handler("cssls", {
    filetypes = {"css","scss","less"},
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
    single_file_support = true
  })
end

return M
