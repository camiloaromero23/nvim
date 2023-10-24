return {
  "ThePrimeagen/harpoon",
  opts = {
    global_settings = {
      -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      save_on_toggle = false,
      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,
      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { "harpoon" },
    },
  },
  keys = {
    { "<leader>ha", '<cmd> lua require("harpoon.mark").add_file()<CR>', silent = true, desc = "Mark File" },
    { "<leader>hm", '<cmd> lua require("harpoon.ui").toggle_quick_menu()<CR>', silent = true, desc = "Quick Menu" },
    { "<leader>hy", '<cmd> lua require("harpoon.ui").nav_file(1)<CR>', silent = true, desc = "Go to mark 1" },
    { "<leader>hu", '<cmd> lua require("harpoon.ui").nav_file(2)<CR>', silent = true, desc = "Go to mark 2" },
    { "<leader>hi", '<cmd> lua require("harpoon.ui").nav_file(3)<CR>', silent = true, desc = "Go to mark 3" },
    { "<leader>ho", '<cmd> lua require("harpoon.ui").nav_file(4)<CR>', silent = true, desc = "Go to mark 4" },
  },
}
