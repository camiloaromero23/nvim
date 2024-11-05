return {
  "michaelrommel/nvim-silicon",
  cmd = "Silicon",
  opts = custom_nvim.silicon_screenshots,
  keys = {
    {
      "<leader>S",
      "<cmd>Silicon<CR>",
      desc = "Take Code Screenshot 📸",
      mode = "v",
    },
  },
}
