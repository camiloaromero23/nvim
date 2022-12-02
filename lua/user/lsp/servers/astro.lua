local M = {}
M.setup = function()
  require("user.lsp.setup").setup_handler("astro", {
    init_options = {
      configuration = {},
      typescript = {
        serverPath = "/usr/local/lib/node_modules/typescript/lib/typescript.js",
      },
    },
    filetypes = { "astro" },
    cmd = { "astro-ls", "--stdio" },
  })
end

return M
