return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = {
    "mason.nvim",
    { "mason-org/mason-lspconfig.nvim", config = function() end },
  },
  opts = {
    -- options for vim.diagnostic.config()
    ---@type vim.diagnostic.Opts
    diagnostics = {
      underline = true,
      update_in_insert = true,
      virtual_text = {
        prefix = "",
      },
      severity_sort = true,
      title = false,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = false,
        header = "",
        prefix = "",
        format = function(d)
          local code = d.code or (d.user_data and d.user_data.lsp.code)
          if code then
            local message, _ = string.format("%s [%s]", d.message, code):gsub("1. ", "")
            return message
          end
          return d.message
        end,
      },

      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
          [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
          [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
          [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
        },
        -- linehl = {
        --   [vim.diagnostic.severity.ERROR] = "DiagnosticError",
        --   [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
        --   [vim.diagnostic.severity.HINT] = "DiagnosticHint",
        --   [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
        -- },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "DiagnosticError",
          [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
          [vim.diagnostic.severity.HINT] = "DiagnosticHint",
          [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
        },
      },
    },
  },
}
