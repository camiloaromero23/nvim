vim.api.nvim_create_user_command("OrganizeImports", function()
  if not require("user.lsp.utils").is_ts_ls_attached() then
    vim.notify("Only supported with tsserver", vim.log.levels.INFO, { title = "Organize Imports" })
    return
  end

  if custom_nvim.lsp.use_typescript_tools then
    return
  end

  vim.lsp.buf.execute_command {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "Organize imports",
  }
end, { desc = "OrganizeImports" })

local whichkey = require "which-key"

whichkey.add {
  "<leader>lo",
  "<cmd>OrganizeImports<cr>",
  desc = "Organize Imports",
}
