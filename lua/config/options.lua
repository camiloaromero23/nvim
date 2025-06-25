-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false
vim.g.autoformat = false
vim.g.ai_cmp = false
-- vim.g.lazyvim_blink_main = true

vim.opt.hlsearch = false -- highlight all matches on previous search pattern

vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = " ",
  eob = " ",
}
vim.opt.scrolloff = 8 -- Lines of context
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.timeoutlen = 250 -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 50 -- Save swap file and trigger CursorHold

vim.g.lazyvim_prettier_needs_config = true -- Enable this option to avoid conflicts with Prettier.

vim.filetype.add {
  pattern = {
    [".env.*"] = "dotenv",
  },
}
