local ok, lsp = pcall(require, "lsp-zero")
if not ok then
  return
end

lsp.configure("gopls", {
  single_file_support = true,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  cmd = { "gopls" },
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})
