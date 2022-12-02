local M = {}
local organize_imports = function()
  vim.lsp.buf.execute_command {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
end

local inlayHints = {
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = false,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}

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

  local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_ok then
    return
  end


  require("user.lsp.setup").setup_handler("tsserver", {
    root_dir = lspconfig.util.root_pattern ("package.json","tsconfig.json", "jsconfig.json"),
    filetypes = filetypes,
    cmd = { "typescript-language-server", "--stdio" },
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "OrganizeImports",
      },
    },
    settings = {
      typescript = {
        inlayHints = inlayHints,
      },
      javascript = {
        inlayHints = inlayHints,
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
