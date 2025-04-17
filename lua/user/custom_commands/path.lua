vim.api.nvim_create_user_command("CopyRelativeFilePath", function()
  local Path = require "plenary.path"
  local path = Path:new(vim.fn.expand "%")
  local relative_to_cwd = path:make_relative()
  vim.fn.setreg("+", relative_to_cwd)
  vim.notify("Copied relative path to clipboard: " .. relative_to_cwd, vim.log.levels.INFO)
end, {})

vim.keymap.set("n", "<leader>yf", "<cmd>CopyRelativeFilePath<CR>", {
  desc = "Copy relative file path to clipboard",
})

