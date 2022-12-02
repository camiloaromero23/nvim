local M = {}
M.setup = function()
  require("user.lsp.setup").setup_handler("rust_analyzer", {
    filetypes = { "rust", "rs" },
    cmd = { "rust-analyzer" },
  })
end

return M
