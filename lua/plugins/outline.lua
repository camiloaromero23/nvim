if true then
  return {}
end

return {
  {
    "hedyhli/outline.nvim",
    keys = {
      { "<leader>cs", false },
      { "<leader>co", "<cmd>Outline<cr>", desc = "Toggle Outline" },
    },
  },
}
