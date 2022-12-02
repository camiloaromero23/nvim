local M = {}

M.setup = function()

  require("user.lsp.setup").setup_handler("denols", { })
end

M.organize_imports = function()
  local whichkey = require "which-key"
  local opts = custom_nvim.which_key.opts
  whichkey.register({ l = { o = { "<cmd>OrganizeImports<cr>", "Organize Imports" } } }, opts)
end

return M
