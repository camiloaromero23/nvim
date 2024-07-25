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
  local dependency_types = { "devDependencies", "dependencies", "peerDependencies" }

  for _, dep_type in ipairs(dependency_types) do
    local dependencies = package_json[dep_type]
    if dependencies and dependencies[field] then
      return true
    end
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
    if client.name == "tsserver" or client.name == "typescript-tools" then
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

M.hover = function()
  -- focus hover window if it is already open
  local winnr = vim.fn.bufwinnr "lsp_hover"
  if winnr ~= -1 then
    vim.api.nvim_set_current_win(winnr)
    return
  end

  local params = vim.lsp.util.make_position_params()

  vim.lsp.buf_request_all(0, "textDocument/hover", params, function(responses)
    if vim.tbl_isempty(responses) then
      vim.notify "No information available"
      return
    end

    local value = ""

    local responses_count = 0
    for _ in pairs(responses) do
      responses_count = responses_count + 1
    end

    local client_names = {}

    for client_id, response in pairs(responses) do
      local result = response.result
      local client = vim.lsp.get_client_by_id(client_id)

      if client == nil or result == nil or result.contents == nil then
        goto continue
      end

      local result_contents = result.contents[1] or result.contents

      if result_contents == nil then
        goto continue
      end

      if responses_count > 1 then
        value = value .. client.name .. "\n"
        table.insert(client_names, client.name)
      end
      if result_contents.language then
        value = value .. string.format("```%s\n%s```\n\n", result_contents.language, result_contents.value)
      else
        value = value .. result_contents.value
      end

      ::continue::
    end

    value = value:gsub("\r", "")

    local contents = vim.lsp.util.convert_input_to_markdown_lines(value)

    local bufnr = vim.lsp.util.open_floating_preview(contents, "markdown", {
      focus_id = "lsp_hover",
      border = "single",
      -- width = 5,

      -- height = 5,
      max_height = 12,
      max_width = 77,
      focus = true,
      focusable = true,
    })
    -- Add highlights to client names
    local line_num = 0
    for _, line in ipairs(contents) do
      for _, client_name in ipairs(client_names) do
        local start_col = line:find(client_name, 1, true)
        if start_col then
          vim.api.nvim_buf_add_highlight(bufnr, -1, "Keyword", line_num, start_col - 1, start_col - 1 + #client_name)
        end
      end
      line_num = line_num + 1
    end
  end)
end

return M
