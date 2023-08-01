return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      height = 0.95, -- height will be 95% of the editor height
      width = 0.7, -- width will be 70% of the editor width
    },
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
  },
}
