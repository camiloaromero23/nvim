return {
  {
    "folke/trouble.nvim",
    opts = {
      auto_preview = false,
    },
    config = function(_, opts)
      require("trouble").setup(opts)

      vim.api.nvim_set_hl(0, "TroubleNormal", {})
      vim.api.nvim_set_hl(0, "TroubleNormalNC", {})
    end,
    keys = {
      {
        "<C-q>",
        function()
          require("trouble").toggle { mode = "qflist" }
        end,
      },
      {
        "]q",
        function()
          ---@diagnostic disable-next-line: missing-parameter, missing-fields
          require("trouble").next {
            skip_groups = true,
            jump = true,
          }
        end,
      },
      {
        "[q",
        function()
          ---@diagnostic disable-next-line: missing-parameter, missing-fields
          require("trouble").prev {
            skip_groups = true,
            jump = true,
          }
        end,
      },
    },
  },
}
