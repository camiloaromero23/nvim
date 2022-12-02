local M = {}
M.setup = function()
  local ok, schemastore = pcall(require, "schemastore")
  if not ok then
    return
  end

  local capabilities = require("user.lsp.common").capabilities
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require("user.lsp.setup").setup_handler("jsonls", {
    settings = {
      json = {
        schemas = schemastore.json.schemas(),
        validate = { enable = true },
      },
    },
  })
end

return M
