local M = {}
M.setup = function()
  require("user.lsp.setup").setup_handler("sumneko_lua", {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "custom_nvim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        hint = { enable = true },
        telemetry = { enable = false },
      },
    },
  })
end
return M
