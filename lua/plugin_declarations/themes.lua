return {
  { "navarasu/onedark.nvim", cond = custom_nvim.colorscheme == "onedark" },
  { "marko-cerovac/material.nvim", cond = custom_nvim.colorscheme == "material" },
  {
    "HoNamDuong/hybrid.nvim",
    cond = custom_nvim.colorscheme == "hybrid",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        navic = {
          enabled = true,
        },
        telescope = {
          enabled = true,
          style = "nvchad"
        },
      },
    },
    cond = custom_nvim.colorscheme == "catppuccin",
    priority = 1000,
  },
  { "folke/tokyonight.nvim", name = "tokyonight", cond = custom_nvim.colorscheme == "tokyonight" },
}
