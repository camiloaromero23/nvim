-- if client.name == "tsserver" then
--   -- TODO: re-include this feat
--   -- require("user.lsp.servers.tsserver").organize_imports()
--   client.server_capabilities.document_formatting = false
--   -- client.server_capabilities.semanticTokensProvider = nil
-- end
local lsp_ok, lsp = pcall(require, "lsp-zero")
if not lsp_ok then
  return
end
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

-- if require("user.lsp.utils").is_vue_project() then
--   return
-- end

if require("user.lsp.utils").is_deno_project() then
  return
end

local organize_imports = function()
  vim.lsp.buf.execute_command {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "Organize imports",
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

local filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
}

lsp.configure("tsserver", {
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
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
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    -- client.server_capabilities.semanticTokensProvider = nil
    local whichkey = require "which-key"
    local opts = custom_nvim.which_key.opts
    whichkey.register({ l = { o = { "<cmd>OrganizeImports<cr>", "Organize Imports" } } }, opts)
  end,
})
