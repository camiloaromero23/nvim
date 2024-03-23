return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  init = function()
    require("which-key").register {
      ["<leader>S"] = {
        ":Silicon<CR>",
        "Take Code Screenshot 📸",
        mode = "v",
      },
    }
  end,
  config = function()
    require("silicon").setup {
      font = "CaskaydiaCove Nerd Font=34;Noto Emoji=34",
      theme = "Catppuccin Mocha",
      to_clipboard = true,
    }
  end,
}
