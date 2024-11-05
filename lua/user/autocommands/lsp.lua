local augroups = require "user.augroups"

local lsp_utils = require "user.lsp.utils"

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroups.lspFeatures,
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local lsp_common = require "user.lsp.common"
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    if client == nil then
      return
    end

    if client.server_capabilities.documentSymbolProvider then
      lsp_common.attach_navic(client, bufnr)
    end
    -- Code lens
    if custom_nvim.lsp.code_lens and client.server_capabilities.codeLensProvider then
      lsp_common.code_lens()
    end

    vim.keymap.set("n", "K", lsp_utils.hover, {
      buffer = bufnr,
      desc = "Show Hover",
      noremap = true,
      silent = true,
    })
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {
    --   buffer = bufnr,
    --   desc = "Rename",
    --   noremap = true,
    --   silent = true,
    -- })

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
      buffer = bufnr,
      desc = "Go to Definition",
      noremap = true,
      silent = true,
    })

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
      buffer = bufnr,
      desc = "Go to declaration",
      noremap = true,
      silent = true,
    })

    vim.keymap.set("n", "gr", vim.lsp.buf.references, {
      buffer = bufnr,
      desc = "Go to references",
      noremap = true,
      silent = true,
    })

    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {
      buffer = bufnr,
      desc = "Go to Implementation",
      noremap = true,
      silent = true,
    })

    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, {
      buffer = bufnr,
      desc = "Show signature help",
      noremap = true,
      silent = true,
    })

    vim.keymap.set("n", "gl", function()
      vim.diagnostic.open_float {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
        format = function(d)
          local code = d.code or (d.user_data and d.user_data.lsp.code)
          if code then
            local msg = string.format("%s [%s]", d.message, code):gsub("1. ", "")
            return msg
          end
          return d.message
        end,
        scope = "line",
      }
    end, {
      desc = "Show line diagnostics",
      noremap = true,
      silent = true,
    })

    -- Set autocommands conditional on server_capabilities
    local status_ok, highlight_supported = pcall(function()
      return client.supports_method "textDocument/documentHighlight"
    end)
    if not status_ok or not highlight_supported then
      return
    end
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = augroups.lspDocumentHighlight,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      group = augroups.lspDocumentHighlight,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end,
})
