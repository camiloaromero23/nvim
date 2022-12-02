local M = {}
M.setup = function()
  local ok, schemastore = pcall(require, "schemastore")
  if not ok then
    return
  end
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
