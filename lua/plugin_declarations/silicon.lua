return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  config = function()
    require("silicon").setup {
      font = "CaskaydiaCove Nerd Font=34;Noto Emoji=34",
      theme = "Dracula",
    }
  end,
}
