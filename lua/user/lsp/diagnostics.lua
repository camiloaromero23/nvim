local icons = require "user.icons"
custom_nvim.signs = {
  { name = "DiagnosticSignError", text = icons.diagnostics.Error },
  { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
  { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
  { name = "DiagnosticSignInfo", text = icons.diagnostics.BigInformation },
}

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
      [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = icons.diagnostics.BigInformation,
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
  float = {
    focusable = false,
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
  severity_sort = true,
  underline = true,
  update_in_insert = true,
  virtual_text = {
    prefix = "",
  },
  title = false,
}
