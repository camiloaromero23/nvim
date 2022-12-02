local M = {}
M.setup = function()
  if require("user.lsp.utils").is_vue_project() then
    return
  end

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
