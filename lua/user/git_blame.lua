vim.g.gitblame_message_template = "      <author>, <date> • <summary>"
vim.g.gitblame_date_format = "%r"
vim.g.gitblame_ignored_filetypes = { "NvimTree", "netrw", "packer" }
vim.g.gitblame_set_extmark_options = {
  hl_mode = "combine",
  priority = 10000,
}
