return {
  {
    "folke/trouble.nvim",
    opts = {
      auto_preview = false, -- automatically open preview when on an item
      warn_no_results = false, -- show a warning when there are no results
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
