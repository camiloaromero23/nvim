local ok, nls = pcall(require, "null-ls")

if not ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = nls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = nls.builtins.diagnostics

nls.setup {
  debug = false,
  sources = {
    formatting.prettier,
    formatting.black.with { extra_args = { "--fast" } },
    formatting.stylua,
    diagnostics.flake8,
  },
}
