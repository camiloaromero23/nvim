require "user.lsp.configs"
require "user.lua_dev"

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
  return
end

local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  return
end

local servers = {
  "angularls",
  "astro",
  "bashls",
  "denols",
  "dockerls",
  "emmet_ls",
  "eslint",
  "golangci_lint_ls",
  "gopls",
  "html",
  "jsonls",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "svelte",
  "tailwindcss",
  "taplo",
  "texlab",
  "tsserver",
  "volar",
  "yamlls",
  "zk",
  -- Formatters & Linters
  "prettier",
}

local opts = {
  ui = {
    keymaps = {
      toggle_package_expand = "<CR>",
      install_package = "i",
      update_package = "u",
      check_package_version = "c",
      update_all_packages = "U",
      check_outdated_packages = "C",
      uninstall_package = "X",
      cancel_installation = "<C-c>",
      apply_language_filter = "<C-f>",
    },
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,

  github = {
    -- The template URL to use when downloading assets from GitHub.
    -- The placeholders are the following (in order):
    -- 1. The repository (e.g. "rust-lang/rust-analyzer")
    -- 2. The release version (e.g. "v0.3.0")
    -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
    download_url_template = "https://github.com/%s/releases/download/%s/%s",
  },
}

mason.setup(opts)

mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local capabilities = require("user.lsp.common").capabilities
local on_attach = require("user.lsp.common").on_attach

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "custom_nvim", "packer_plugins" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

local web_dev_filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
  "vue",
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = web_dev_filetypes,
  cmd = { "typescript-language-server", "--stdio" },
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = web_dev_filetypes,
  cmd = { "vscode-eslint-language-server", "--stdio" },
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "rust", "rs" },
  cmd = { "rust-analyzer" },
}

lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  single_file_support = true,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  cmd = { "gopls" },
}

lspconfig.golangci_lint_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.astro.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    configuration = {},
    typescript = {
      serverPath = "/usr/local/lib/node_modules/typescript/lib/typescript.js",
    },
  },
  filetypes = { "astro" },
  cmd = { "astro-ls", "--stdio" },
}

lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.cjs", "tailwind.js", "tailwind.cjs"),
}
