local lsp_ok, _ = pcall(require, "lsp-zero")
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
	-- "typescript.inlayHints.enumMemberValues.enabled": true,
	-- "typescript.inlayHints.functionLikeReturnTypes.enabled": true,
	-- "typescript.inlayHints.parameterNames.enabled": "literals",
	-- "typescript.inlayHints.propertyDeclarationTypes.enabled": true,
	-- "typescript.inlayHints.parameterTypes.enabled": true,
	-- "typescript.inlayHints.variableTypes.enabled": true,
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

lspconfig.tsserver.setup {
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
}
