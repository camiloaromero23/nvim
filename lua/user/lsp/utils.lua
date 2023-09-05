local M = {}

function M.format_filter(client)
  local filetype = vim.bo.filetype
  local ok, n = pcall(require, "null-ls")

  if not ok then
    return
  end

  local s = require "null-ls.sources"
  local method = n.methods.FORMATTING
  local avalable_formatters = s.get_available(filetype, method)

  if #avalable_formatters > 0 then
    return client.name == "null-ls"
  elseif client.supports_method "textDocument/formatting" then
    return true
  else
    return false
  end
end

function M.format(opts)
  opts = opts or {}
  opts.filter = opts.filter or M.format_filter

  if vim.lsp.buf.format then
    return vim.lsp.buf.format(opts)
  end

  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()

  local clients = vim.lsp.get_clients {
    id = opts.id,
    bufnr = bufnr,
    name = opts.name,
  }

  if opts.filter then
    ---@diagnostic disable-next-line: param-type-mismatch
    clients = vim.tbl_filter(opts.filter, clients)
  end

  clients = vim.tbl_filter(function(client)
    return client.supports_method "textDocument/formatting"
  end, clients)

  if #clients == 0 then
    vim.notify_once "[LSP] Format request failed, no matching language servers."
  end

  local timeout_ms = opts.timeout_ms or 1000
  for _, client in pairs(clients) do
    local params = vim.lsp.util.make_formatting_params(opts.formatting_options)
    local result, err = client.request_sync("textDocument/formatting", params, timeout_ms, bufnr)
    if result and result.result then
      vim.lsp.util.apply_text_edits(result.result, bufnr, client.offset_encoding)
    elseif err then
      vim.notify(string.format("[LSP][%s] %s", client.name, err), vim.log.levels.WARN)
    end
  end
end

M.is_in_package_json = function(field)
  if vim.fn.filereadable(vim.fn.getcwd() .. "/package.json") == 0 then
    return false
  end

  local package_json = vim.fn.json_decode(vim.fn.readfile "package.json")
  if package_json == nil then
    return false
  end
  if package_json[field] ~= nil then
    return true
  end
  local dev_dependencies = package_json["devDependencies"]
  if dev_dependencies ~= nil and dev_dependencies[field] ~= nil then
    return true
  end
  local dependencies = package_json["dependencies"]
  if dependencies ~= nil and dependencies[field] ~= nil then
    return true
  end
end

M.is_vue_project = function()
  ---@diagnostic disable-next-line: missing-parameter
  return (vim.fn.glob "*.vue" ~= "" or M.is_in_package_json "vue")
end

M.is_deno_project = function()
  local res = vim.fn.filereadable(vim.fn.getcwd() .. "/deno.json")
    or vim.fn.filereadable(vim.fn.getcwd() .. "/deno.jsonc")
  return res
end

M.is_tsserver_attached = function()
  local clients = vim.lsp.get_clients()
  for _, client in ipairs(clients) do
    if client.name == "tsserver" then
      return true
    end
  end
  return false
end

M.format_selection = function()
  vim.lsp.buf.format {
    range = { ["start"] = vim.api.nvim_buf_get_mark(0, "<"), ["end"] = vim.api.nvim_buf_get_mark(0, ">") },
  }
end

return M
