vim.api.nvim_create_user_command("OrganizeImports", function()
  if not require("user.utils.lsp_functions").is_ts_ls_attached() then
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

vim.keymap.set("n", "<leader>lo", "<cmd>OrganizeImports<cr>", { desc = "Organize Imports" })
