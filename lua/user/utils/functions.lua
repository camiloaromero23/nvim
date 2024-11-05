local M = {}

---@param t table
---@return number
function M.table_length(t)
  local count = 0
  for _ in pairs(t) do
    count = count + 1
  end
  return count
end

function M.smart_quit()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd "q!"
      end
    end)
  else
    vim.cmd "q!"
  end
end

function M.isempty(s)
  return s == nil or s == ""
end

function M.get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_get_option_value, opt, { buf = 0 })

  if not status_ok then
    return nil
  end

  return buf_option
end

return M
