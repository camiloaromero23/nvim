vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<ESC>", { desc = "Quit insert mode" })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Quit insert mode" })
vim.keymap.set("i", "jj", "<ESC>", { desc = "Quit insert mode" })

vim.keymap.set("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move current line / block" })
vim.keymap.set("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move current line / block" })
vim.keymap.set("i", "<A-Up>", "<C-\\><C-N><C-w>k", { desc = "Move current line / block" })
vim.keymap.set("i", "<A-Down>", "<C-\\><C-N><C-w>j", { desc = "Move current line / block" })
vim.keymap.set("i", "<A-Left>", "<C-\\><C-N><C-w>h", { desc = "Move current line / block" })
vim.keymap.set("i", "<A-Right>", "<C-\\><C-N><C-w>l", { desc = "Move current line / block" })

vim.keymap.set("i", ",", ",<c-g>u", { desc = "Add , to undo tree" })

vim.keymap.set("i", ".", ".<c-g>u", { desc = "Add . to undo tree" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to left window" })

vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to down window" })

vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to up window" })

vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move focus to right window" })

vim.keymap.set("n", "<A-Up>", "<cmd>resize -2<CR>", { desc = "Resize up window" })

vim.keymap.set("n", "<A-Down>", "<cmd>resize +2<CR>", { desc = "Resize down window" })

vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize left window" })

vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize right window" })

vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move current line / block" })

vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move current line / block" })

vim.keymap.set("n", "<C-q>", "<cmd>QuickFixToggle<CR>", { desc = "Toggle quickfix list" })

vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Jump to next quickfix entry" })
vim.keymap.set("n", "[q", "<cmd>cprev<CR>", { desc = "Jump to previous quickfix entry" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down one page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up one page" })
vim.keymap.set("n", "n", "Nzzzv", { desc = "Jump to next match" })
vim.keymap.set("n", "N", "nzzzv", { desc = "Jump to previous match" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Jump to next match" })

vim.keymap.set("n", "dh", "<cmd>diffget //2<CR>", { desc = "Choose left diff" })
vim.keymap.set("n", "dl", "<cmd>diffget //3<CR>", { desc = "Choose right diff" })

vim.keymap.set("n", "<leader>8", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Replace all occurrences of word" })


vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Move cursor to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Move cursor to down window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Move cursor to up window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Move cursor to right window" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent block left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent block right" })

-- vim.keymap.set("x", "K", ":move '<-2<CR>", { desc = "Move block up" })
-- vim.keymap.set("x", "J", ":move '>+1<CR>", { desc = "Move block down" })

vim.keymap.set("x", "<A-j>", "<cmd>move '>+1<CR>", { desc = "Move block down" })
vim.keymap.set("x", "<A-k>", "<cmd>move '<-2<CR>", { desc = "Move block up" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overriding current register" })

vim.keymap.set("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"')
vim.keymap.set("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"')
