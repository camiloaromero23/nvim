return {
  "michaelrommel/nvim-silicon",
  cmd = "Silicon",
  opts = {
    font = custom_nvim.silicon_screenshots.font,
    theme = custom_nvim.silicon_screenshots.theme,
    to_clipboard = true,
  },
  keys = {
    {
      "<leader>S",
      ":Silicon<CR>",
      silent = true,
      desc = "Take Code Screenshot 📸",
      mode = "v",
    },
  },
}
