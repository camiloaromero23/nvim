local M = {}
M.setup = function()
  require("user.lsp.setup").setup_handler("gopls", {
    single_file_support = true,
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    cmd = { "gopls" },
  })
end

return M
