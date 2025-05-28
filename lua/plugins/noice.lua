return {
  "folke/noice.nvim",
  event = "VeryLazy",

  opts = {
    lsp = {
      documentation = {
        ---@type NoiceViewOptions
        opts = {
          size = {
            height = 10,
          },
          -- zindex = 50,
          -- position = {
          --   row = -10 - 1,
          -- },
        },
      },
    },
    presets = {
      bottom_search = false,
      command_palette = false,
      lsp_doc_border = true,
    },
    documentation = {
      enabled = false,
    },
    -- popupmenu = {
    --   enabled = false,
    -- },
  },
  keys = {
    {
      "<c-d>",
      function()
        if not require("noice.lsp").scroll(4) then
          return "<c-d>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll Forward",
      mode = { "i", "n", "s" },
    },
    {
      "<c-u>",
      function()
        if not require("noice.lsp").scroll(-4) then
          return "<c-u>"
        end
      end,
      silent = true,
      expr = true,
      desc = "Scroll Backward",
      mode = { "i", "n", "s" },
    },
  },
}
