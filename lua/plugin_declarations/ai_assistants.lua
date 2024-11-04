return {
  {
    "supermaven-inc/supermaven-nvim",
    opts = {
      keymaps = {
        accept_suggestion = "kk",
      },
      log_level = "off",
    },
    event = "User FileOpened",
    cond = custom_nvim.enable_supermaven,
  },
  {
    "github/copilot.vim",
    cond = custom_nvim.enable_copilot,
    config = function()
      vim.g.copilot_node_command = "$FNM_DIR/aliases/lts-latest/bin/node"
      -- vim.g.copilot_filetypes = { lua = false } -- Disable copilot for filetypes

      vim.keymap.set("i", "kk", 'copilot#Accept("")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.keymap.del("i", "<Tab>")
      vim.cmd "silent! Copilot restart"
    end,
    event = "User FileOpened",
  },
  {
    "exafunction/codeium.vim",
    cond = custom_nvim.enable_codeium,
    config = function()
      vim.g.codeium_disable_bindings = 1

      vim.keymap.set("i", "kk", "codeium#Accept", {
        expr = true,
        replace_keycodes = false,
      })

      vim.keymap.set("i", "<c-,>", vim.fn["codeium#CycleCompletions"](-1), { expr = true })

      vim.keymap.set("i", "<c-x>", "codeium#Clear", { expr = true })

      vim.keymap.set("i", "<c-;>", vim.fn["codeium#CycleCompletions"](1), { expr = true })
    end,
    event = "User FileOpened",
  },
}
