local ok, template_string = pcall(require, "template-string")

if not ok then
  return
end

template_string.setup {
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }, -- filetypes where the plugin is active
  jsx_brackets = true, -- must add brackets to jsx attributes
  remove_template_string = true, -- remove backticks when there are no template string
}
