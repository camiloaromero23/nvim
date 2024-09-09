local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

if require("user.lsp.utils").is_vue_project() then
  return
end
-- if require("user.lsp.utils").is_deno_project() then
--   return
-- end

-- LSP settings (for overriding per client)
local inlayHints = {
  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
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

lspconfig.ts_ls.setup {
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
  filetypes = filetypes,
  cmd = { "typescript-language-server", "--stdio" },
  init_options = {
    preferences = inlayHints,
  },
  settings = {
    javascript = {
      inlayHints = inlayHints,
    },
    typescript = {
      inlayHints = inlayHints,
    },
  },
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    -- client.server_capabilities.semanticTokensProvider = nil
  end,
  capabilities = custom_nvim.lsp.capabilities,
}
