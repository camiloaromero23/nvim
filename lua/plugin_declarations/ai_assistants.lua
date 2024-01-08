return {
  {
    "github/copilot.vim",
    cond = custom_nvim.enable_copilot,
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_node_command = "$FNM_DIR/aliases/lts-latest/bin/node"
      -- vim.g.copilot_filetypes = { lua = false } -- Disable copilot for filetypes

      vim.keymap.set("i", "kk", 'copilot#Accept("")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
    event = "User FileOpened",
  },
  {
    "exafunction/codeium.vim",
    cond = custom_nvim.enable_codeium,
    config = function()
      vim.g.codeium_disable_bindings = 1

      local keymappings = require "user.keymappings.utils"

      keymappings.set_keymaps("i", "kk", {
        vim.fn["codeium#Accept"],
        { expr = true },
      })

      keymappings.set_keymaps("i", "<c-,>", function()
        vim.fn["codeium#CycleCompletions"](-1)
      end)

      keymappings.set_keymaps("i", "<c-x>", function()
        vim.fn["codeium#Clear"]()
      end)

      keymappings.set_keymaps("i", "<c-;>", function()
        vim.fn["codeium#CycleCompletions"](1)
      end)
    end,
    event = "User FileOpened",
  },
}
