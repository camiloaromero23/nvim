local lua_dev_loaded, lua_dev = pcall(require, "lua-dev")
if not lua_dev_loaded then
  return
end

local lua_dev_opts = {
  lspconfig = {
    settings = {
      Lua = {
        completion = {
          globals = { "vim", "custom_nvim", "packer_plugins" },
          -- callSnippet = "Replace"
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          -- library = "~/.config/nvim"
        },
      },
    },
  },
  library = {
    vimruntime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    -- plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    plugins = { "plenary.nvim" },
  },
}

-- lua_dev.setup()
lua_dev.setup(lua_dev_opts)
