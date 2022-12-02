local M = {}

M.setup = function()
  local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_ok then
    return
  end

  require("user.lsp.setup").setup_handler("volar", {
    filetypes = { "javascript", "typescript", "vue" },
    root_dir = lspconfig.util.root_pattern "package.json"
      or lspconfig.util.root_pattern "vue.config.js"
      or vim.fn.getcwd(),
    init_options = {
      documentFeatures = {
        documentColor = false,
        documentFormatting = {
          defaultPrintWidth = 80,
        },
        documentSymbol = true,
        foldingRange = true,
        linkedEditingRange = true,
        selectionRange = true,
      },
      languageFeatures = {
        callHierarchy = true,
        codeAction = true,
        codeLens = true,
        completion = {
          autoImport = true,
          defaultAttrNameCase = "kebabCase",
          defaultTagNameCase = "both",
          useScaffoldSnippets = true,
        },
        definition = true,
        diagnostics = true,
        documentHighlight = true,
        documentLink = true,
        hover = true,
        implementation = true,
        references = true,
        rename = true,
        renameFileRefactoring = true,
        schemaRequestService = true,
        semanticTokens = false,
        signatureHelp = true,
        typeDefinition = true,
      },
      typescript = {
        serverPath = "/usr/local/lib/node_modules/typescript/lib/typescript.js",
      },
    },
  })
end

return M
