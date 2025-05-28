local M = {}

local function table_length(t)
  local count = 0
  for _ in pairs(t) do
    count = count + 1
  end
  return count
end

M.hover = function()
  -- focus hover window if it is already open
  local winnr = vim.fn.bufwinnr "lsp_hover"
  if winnr ~= -1 then
    vim.api.nvim_set_current_win(winnr)
    return
  end

  local params = vim.lsp.util.make_position_params(0, "utf-8")

  local value = ""

  local clients = vim.lsp.get_clients()
  local hover_results = {}
  local client_names = {}

  for _, client in ipairs(clients) do
    if not client:supports_method "textDocument/hover" then
      goto continue
    end

    local res = client:request_sync("textDocument/hover", params, 500, 0)
    if res == nil or res.err ~= nil then
      goto continue
    end

    local result = res.result

    if result == nil or result.contents == nil then
      goto continue
    end

    local result_contents = result.contents[1] or result.contents

    local hover_value = result_contents

    if type(result_contents) == "string" then
      hover_value = { value = result_contents }
    end

    if hover_value == nil or hover_value.value == nil then
      goto continue
    end

    hover_results[client.name] = hover_value

    ::continue::
  end

  local hover_count = table_length(hover_results)
  for client_name, result in pairs(hover_results) do
    local result_value = result.value
    result_value = result_value:gsub("^\n", "") .. "\n"
    if hover_count > 1 then
      value = value .. client_name .. "\n"
      table.insert(client_names, client_name)
    end
    if result.language then
      value = value .. string.format("```%s\n%s```\n\n", result.language, result_value)
    else
      value = value .. result_value
    end
  end

  if value == "" then
    return
  end

  local contents = vim.lsp.util.convert_input_to_markdown_lines(value)

  local bufnr, win = vim.lsp.util.open_floating_preview(contents, "markdown", {
    focus_id = "lsp_hover",
    border = "rounded",
    -- width = 5,

    -- height = 5,
    max_height = 12,
    max_width = 77,
    focus = true,
    focusable = true,
  })

  vim.api.nvim_set_option_value("spell", false, {
    win = win,
  })

  -- Add highlights to client names
  local ns = vim.api.nvim_create_namespace "Hover Highlights"
  local line_num = 0
  for _, line in ipairs(contents) do
    for _, client_name in ipairs(client_names) do
      local start_col = line:find(client_name, 1, true)
      if start_col then
        vim.hl.range(bufnr, ns, "Keyword", { line_num, start_col - 1 }, { line_num, start_col + #client_name })
      end
    end
    line_num = line_num + 1
  end
end

return M
