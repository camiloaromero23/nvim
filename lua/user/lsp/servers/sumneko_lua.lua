local M = {}
M.setup = function()
  require("user.lsp.setup").setup_handler("sumneko_lua", {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "custom_nvim", "packer_plugins" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        hint = { enable = true },
      },
    },
  })
end
return M
