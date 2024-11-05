return {
  "michaelrommel/nvim-silicon",
  cmd = "Silicon",
  opts = custom_nvim.silicon_screenshots,
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
