local M = {}

local utils = require "user.utils.functions"

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

M.is_ts_ls_attached = function()
  local clients = vim.lsp.get_clients()
  for _, client in ipairs(clients) do
    if client.name == "ts_ls" or client.name == "typescript-tools" then
      return true
    end
  end
  return false
end

M.format_selection = function()
  vim.lsp.buf.format {
    range = {
      ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
      ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
    },
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

  local value = ""

  local clients = vim.lsp.get_clients()
  local hover_results = {}
  local client_names = {}

  for _, client in ipairs(clients) do
    if not client.supports_method "textDocument/hover" then
      goto continue
    end

    local res = client.request_sync("textDocument/hover", params, 500, 0)
    if res == nil or res.err ~= nil then
      goto continue
    end

    local result = res.result

    if result == nil or result.contents == nil then
      goto continue
    end

    local result_contents = result.contents[1] or result.contents

    if result_contents == nil or result_contents.value == nil then
      goto continue
    end

    hover_results[client.name] = result_contents

    ::continue::
  end

  local hover_count = utils.table_length(hover_results)
  for client_name, result in pairs(hover_results) do
    if hover_count > 1 then
      value = value .. client_name .. "\n"
      table.insert(client_names, client_name)
    end
    if result.language then
      value = value .. string.format("```%s\n%s```\n\n", result.language, result.value)
    else
      value = value .. result.value
    end

  end

  if value == "" then
    return
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
end

return M
