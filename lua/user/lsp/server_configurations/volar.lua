if not require("user.lsp.utils").is_vue_project() then
  return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local inlayHints = {
  enumMemberValues = {
    enabled = true,
  },
  functionLikeReturnTypes = {
    enabled = false,
  },
  parameterNames = {
    enabled = "none",
    suppressWhenArgumentMatchesName = false,
  },
  parameterTypes = {
    enabled = true,
  },
  propertyDeclarationTypes = {
    enabled = true,
  },
  variableTypes = {
    enabled = true,
  },
}

lspconfig.volar.setup {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
  settings = {
    typescript = {
      inlayHints = inlayHints,
    },
    javascript = {
      inlayHints = inlayHints,
    },
    vue = {
      inlayHints = {
        inlineHandlerLeading = true,
        missingProps = true,
        optionsWrapper = true,
        vBindShorthand = true,
      },
    },
  },
  on_attach = function(client)
    client.server_capabilities.document_formatting = false
  end,
  capabilities = custom_nvim.lsp.capabilities,
}
