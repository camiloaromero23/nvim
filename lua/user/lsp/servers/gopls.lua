local M = {}
M.setup = function()
  require("user.lsp.setup").setup_handler("gopls", {
    single_file_support = true,
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    cmd = { "gopls" },
    settings = {
      gopls = {
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  })
end

return M
