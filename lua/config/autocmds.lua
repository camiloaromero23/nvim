-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

-- Enable LSP codelens auto-refresh only for markdown buffers
-- Keeps LazyVim global codelens disabled, but gives markdown-oxide its reference count lenses automatically
local function codelens_supported(bufnr)
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if c.server_capabilities and c.server_capabilities.codeLensProvider then
      return true
    end
  end
  return false
end
-- Refresh codelens only when the current buffer is markdown and the attached client supports it
local function refresh_markdown_codelens(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end
  if vim.bo[bufnr].buftype ~= "" then
    return
  end
  if vim.bo[bufnr].filetype ~= "markdown" then
    return
  end
  if not codelens_supported(bufnr) then
    return
  end
  vim.lsp.codelens.enable(true,{ bufnr = bufnr })
end
-- Create markdown-only codelens refresh triggers
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave", "TextChanged" }, {
  callback = function(args)
    refresh_markdown_codelens(args.buf)
  end,
})
