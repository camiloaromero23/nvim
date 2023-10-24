return {
  "jackMort/ChatGPT.nvim",
  opts = {
    api_key_cmd = "pass api/tokens/openai",
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  event = "User FileOpened",
  enabled = custom_nvim.enable_chatgpt,
}
