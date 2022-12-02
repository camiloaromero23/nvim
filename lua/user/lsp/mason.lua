local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

mason.setup {
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

local mason_lsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_ok then
  return
end

local servers = {
  "angularls",
  "astro",
  "bashls",
  "cssls",
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
  -- "black",
  -- "prettier",
}

mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}
