return {
  "michaelrommel/nvim-silicon",
  cmd = "Silicon",
  opts = {
    -- font = "Geist Mono=34",
    theme = "Catppuccin Mocha",
    to_clipboard = true,
    background = "#11111B",
    shadow_blur_radius = 0,
  },
  keys = {
    {
      "<leader>S",
      ":'<,'>Silicon<CR>",
      desc = "Take Code Screenshot 📸",
      mode = { "v", "x" },
      silent = true,
    },
  },
}
