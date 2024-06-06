return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require "harpoon"

    harpoon:setup {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
        key = function()
          return vim.loop.cwd()
        end,
      },
    }
  end,
  keys = {
    {
      "<leader>ha",
      '<cmd> lua require("harpoon"):list():add()<CR>',
      silent = true,
      desc = "Mark File",
    },
    {
      "<leader>hm",
      '<cmd> lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>',
      silent = true,
      desc = "Quick Menu",
    },
    {
      "<leader>hs",
      '<cmd> lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>',
      silent = true,
      desc = "Quick Menu",
    },
    {
      "<leader>hq",
      '<cmd> lua require("harpoon"):list():select(1)<CR>',
      silent = true,
      desc = "Go to mark 1",
    },
    {
      "<leader>hw",
      '<cmd> lua require("harpoon"):list():select(2)<CR>',
      silent = true,
      desc = "Go to mark 2",
    },
    {
      "<leader>he",
      '<cmd> lua require("harpoon"):list():select(3)<CR>',
      silent = true,
      desc = "Go to mark 3",
    },
    {
      "<leader>hr",
      '<cmd> lua require("harpoon"):list():select(4)<CR>',
      silent = true,
      desc = "Go to mark 4",
    },
    {
      "<leader>hy",
      '<cmd> lua require("harpoon"):list():select(1)<CR>',
      silent = true,
      desc = "Go to mark 1",
    },
    {
      "<leader>hu",
      '<cmd> lua require("harpoon"):list():select(2)<CR>',
      silent = true,
      desc = "Go to mark 2",
    },
    {
      "<leader>hi",
      '<cmd> lua require("harpoon"):list():select(3)<CR>',
      silent = true,
      desc = "Go to mark 3",
    },
    {
      "<leader>ho",
      '<cmd> lua require("harpoon"):list():select(4)<CR>',
      silent = true,
      desc = "Go to mark 4",
    },
  },
}
