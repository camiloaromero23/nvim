local M = {}
M.setup = function()
  local filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
  }

  require("user.lsp.setup").setup_handler("eslint", {
    filetypes = filetypes,
    cmd = { "vscode-eslint-language-server", "--stdio" },
  })
end

return M
