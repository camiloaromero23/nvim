return {
  "michaelrommel/nvim-silicon",
  cmd = "Silicon",
  opts = custom_nvim.silicon_screenshots,
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
