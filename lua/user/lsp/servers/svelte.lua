local M = {}
M.setup = function()
  require("user.lsp.setup").setup_handler("svelte", {})
end

return M
