-- Delete default lazyvim keymaps
-- https://www.lazyvim.org/configuration/general#keymaps for reference

-- Buffer mappings
vim.keymap.del("n", "[b")
vim.keymap.del("n", "]b")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")
vim.keymap.del("n", "<leader>bd")
vim.keymap.del("n", "<leader>bo")
vim.keymap.del("n", "<leader>bD")

-- UI mappings
vim.keymap.del("n", "<leader>ur")

-- Save file
vim.keymap.del({ "i", "x", "n", "s" }, "<C-s>")

-- Commenting
vim.keymap.del("n", "gco")
vim.keymap.del("n", "gcO")

-- Lazy
vim.keymap.del("n", "<leader>l")

-- New file
vim.keymap.del("n", "<leader>fn")

-- Location list
vim.keymap.del("n", "<leader>xl")

-- Quickfix list
vim.keymap.del("n", "<leader>xq")

-- Formatting
vim.keymap.del({ "n", "v" }, "<leader>cf")

-- Diagnostic
vim.keymap.del("n", "<leader>cd")
vim.keymap.del("n", "]d")
vim.keymap.del("n", "[d")
vim.keymap.del("n", "]e")
vim.keymap.del("n", "[e")
vim.keymap.del("n", "]w")
vim.keymap.del("n", "[w")

-- Git
vim.keymap.del("n", "<leader>gg")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gf")
vim.keymap.del("n", "<leader>gl")
vim.keymap.del("n", "<leader>gL")
vim.keymap.del("n", "<leader>gb")
vim.keymap.del({ "n", "x" }, "<leader>gB")
vim.keymap.del({ "n", "x" }, "<leader>gY")

-- Quit
vim.keymap.del("n", "<leader>qq")

-- LazyVim Changelog
vim.keymap.del("n", "<leader>L")

-- Terminal
vim.keymap.del("n", "<leader>fT")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<c-/>")
vim.keymap.del("n", "<c-_>")
vim.keymap.del("t", "<C-/>")
vim.keymap.del("t", "<c-_>")

-- Windows
-- vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")
vim.keymap.del("n", "<leader>wd")

-- Tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>o")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")
