return {
  { "navarasu/onedark.nvim", cond = custom_nvim.colorscheme == "onedark" },
  { "lunarvim/darkplus.nvim", keys = { { "<leader>td", "<cmd>ToggleDarkPlus<cr>", desc = "Toggle DarkPlus Theme" } } },
  { "marko-cerovac/material.nvim", cond = custom_nvim.colorscheme == "material" },
}
