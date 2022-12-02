local M = {}
M.setup = function()
  local filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  }

  require("user.lsp.setup").setup_handler("tsserver", {
    filetypes = filetypes,
    cmd = { "typescript-language-server", "--stdio" },
  })
end

return M
