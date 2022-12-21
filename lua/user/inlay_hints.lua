local ok, inlay_hints = pcall(require, "lsp-inlayhints")

if not ok then
  return
end

inlay_hints.setup {
}

vim.cmd [[hi LspInlayHint guibg=None guifg=darkgray]]
