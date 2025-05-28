return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>l", group = "LSP" },
        { "<leader>s", group = "Search" },
        { "<leader>t", group = "Test" },
        { "<leader>T", group = "Treesitter" },
        { "<leader>b", group = "Buffers" },
        { "<leader>L", group = "Lazy" },
        { "<leader>h", group = "Harpoon" },
        { "<leader>g", group = "Git" },
        { "<leader>D", group = "Dependencies manager 📦" },
        { "<leader>m", group = "Markdown" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
      },
    },
  },
}
