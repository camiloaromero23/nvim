return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      strategies = {
        inline = {
          adapter = "copilot",
          model = "gemini-2.5-pro",
        },
        chat = {
          adapter = "copilot",
          model = "gemini-2.5-pro",
        },
      },
      opts = {
        -- Set debug logging
        log_level = "ERROR",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
  },
}
