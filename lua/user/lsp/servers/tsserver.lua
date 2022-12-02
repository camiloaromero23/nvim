local M = {}
local organize_imports = function()
  vim.lsp.buf.execute_command {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
end

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
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "OrganizeImports",
      },
    },
  })
end

M.organize_imports = function()
  local whichkey = require "which-key"
  local opts = custom_nvim.which_key.opts
  whichkey.register({ l = { o = { "<cmd>OrganizeImports<cr>", "Organize Imports" } } }, opts)
end

return M
