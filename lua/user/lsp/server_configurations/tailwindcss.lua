local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

lspconfig.tailwindcss.setup {
  root_dir = lspconfig.util.root_pattern(
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.js",
    "tailwind.cjs",
    "tailwind.config.ts"
  ),
  capabilities = custom_nvim.lsp.capabilities,
  settings = {
    tailwindCSS = {
      classAttributes = custom_nvim.lsp.tailwindcss_class_attributes,
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
        },
      },
      -- suggestions = false, -- This one is what makes it slow (needed for nvim-cmp)
    },
  },
}
