return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  name = "harpoon",
  opts = {
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
      key = function()
        return vim.uv.cwd()
      end,
    },
  },
  keys = {
    {
      "<leader>ha",
      '<cmd> lua require("harpoon"):list():add()<CR>',
      desc = "Mark File",
    },
    {
      "<leader>hm",
      '<cmd> lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>',
      desc = "Quick Menu",
    },
    {
      "<leader>hq",
      '<cmd> lua require("harpoon"):list():select(1)<CR>',
      desc = "Go to mark 1",
    },
    {
      "<leader>hw",
      '<cmd> lua require("harpoon"):list():select(2)<CR>',
      desc = "Go to mark 2",
    },
    {
      "<leader>he",
      '<cmd> lua require("harpoon"):list():select(3)<CR>',
      desc = "Go to mark 3",
    },
    {
      "<leader>hr",
      '<cmd> lua require("harpoon"):list():select(4)<CR>',
      desc = "Go to mark 4",
    },
  },
}
