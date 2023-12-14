return {
  "f-person/git-blame.nvim",
  opts = {
    message_template = "      <author>, <date> • <summary>",
    date_format = "%r",
    ignored_filetypes = { "NvimTree", "netrw", "packer", "neo-tree" },
    set_extmark_options = {
      hl_mode = "combine",
      priority = 10000,
    },
  },
  event = "User FileOpened",
}
