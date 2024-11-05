vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<ESC>", {
  noremap = true,
  silent = true,
  desc = "Quit insert mode",
})
vim.keymap.set("i", "kj", "<ESC>", {
  noremap = true,
  silent = true,
  desc = "Quit insert mode",
})
vim.keymap.set("i", "jj", "<ESC>", {
  noremap = true,
  silent = true,
  desc = "Quit insert mode",
})

vim.keymap.set(
  "i",
  "<A-j>",
  "<Esc>:m .+1<CR>==gi",
  { noremap = true, silent = true, desc = "Move current line / block" }
)
vim.keymap.set(
  "i",
  "<A-k>",
  "<Esc>:m .-2<CR>==gi",
  { noremap = true, silent = true, desc = "Move current line / block" }
)
vim.keymap.set(
  "i",
  "<A-Up>",
  "<C-\\><C-N><C-w>k",
  { noremap = true, silent = true, desc = "Move current line / block" }
)
vim.keymap.set(
  "i",
  "<A-Down>",
  "<C-\\><C-N><C-w>j",
  { noremap = true, silent = true, desc = "Move current line / block" }
)
vim.keymap.set(
  "i",
  "<A-Left>",
  "<C-\\><C-N><C-w>h",
  { noremap = true, silent = true, desc = "Move current line / block" }
)
vim.keymap.set(
  "i",
  "<A-Right>",
  "<C-\\><C-N><C-w>l",
  { noremap = true, silent = true, desc = "Move current line / block" }
)

vim.keymap.set("i", ",", ",<c-g>u", {
  noremap = true,
  silent = true,
  desc = "Add , to undo tree",
})

vim.keymap.set("i", ".", ".<c-g>u", {
  noremap = true,
  silent = true,
  desc = "Add . to undo tree",
})

vim.keymap.set("n", "<C-h>", "<C-w>h", {
  noremap = true,
  silent = true,
  desc = "Move cursor to left window",
})

vim.keymap.set("n", "<C-j>", "<C-w>j", {
  noremap = true,
  silent = true,
  desc = "Move cursor to down window",
})

vim.keymap.set("n", "<C-k>", "<C-w>k", {
  noremap = true,
  silent = true,
  desc = "Move cursor to up window",
})

vim.keymap.set("n", "<C-l>", "<C-w>l", {
  noremap = true,
  silent = true,
  desc = "Move cursor to right window",
})

vim.keymap.set("n", "<A-Up>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Resize up window" })

vim.keymap.set("n", "<A-Down>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Resize down window" })

vim.keymap.set(
  "n",
  "<A-Left>",
  ":vertical resize -2<CR>",
  { noremap = true, silent = true, desc = "Resize left window" }
)

vim.keymap.set(
  "n",
  "<A-Right>",
  ":vertical resize +2<CR>",
  { noremap = true, silent = true, desc = "Resize right window" }
)

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move current line / block" })

vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move current line / block" })

vim.keymap.set("n", "<C-q>", ":QuickFixToggle<CR>", { noremap = true, silent = true, desc = "Toggle quickfix list" })

vim.keymap.set("n", "]q", ":cnext<CR>", { noremap = true, silent = true, desc = "Jump to next quickfix entry" })
vim.keymap.set("n", "[q", ":cprev<CR>", { noremap = true, silent = true, desc = "Jump to previous quickfix entry" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down one page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll up one page" })
vim.keymap.set("n", "n", "Nzzzv", { noremap = true, silent = true, desc = "Jump to next match" })
vim.keymap.set("n", "N", "nzzzv", { noremap = true, silent = true, desc = "Jump to previous match" })
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true, desc = "Jump to next match" })

vim.keymap.set("n", "dh", "<cmd>diffget //2<CR>", { desc = "Choose left diff" })
vim.keymap.set("n", "dl", "<cmd>diffget //3<CR>", { desc = "Choose right diff" })

vim.keymap.set(
  "t",
  "<C-h>",
  "<C-\\><C-N><C-w>h",
  { noremap = true, silent = true, desc = "Move cursor to left window" }
)
vim.keymap.set(
  "t",
  "<C-j>",
  "<C-\\><C-N><C-w>j",
  { noremap = true, silent = true, desc = "Move cursor to down window" }
)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { noremap = true, silent = true, desc = "Move cursor to up window" })
vim.keymap.set(
  "t",
  "<C-l>",
  "<C-\\><C-N><C-w>l",
  { noremap = true, silent = true, desc = "Move cursor to right window" }
)

vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent block left" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent block right" })

-- vim.keymap.set("x", "K", ":move '<-2<CR>", { noremap = true, silent = true, desc = "Move block up" })
-- vim.keymap.set("x", "J", ":move '>+1<CR>", { noremap = true, silent = true, desc = "Move block down" })

vim.keymap.set("x", "<A-j>", ":move '>+1<CR>", { noremap = true, silent = true, desc = "Move block down" })
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>", { noremap = true, silent = true, desc = "Move block up" })

vim.keymap.set(
  "x",
  "<leader>p",
  '"_dP',
  { noremap = true, silent = true, desc = "Paste without overriding current register" }
)

vim.keymap.set("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true })
vim.keymap.set("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true })

