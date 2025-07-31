-- require "config.deleted-keymaps"
vim.keymap.del("n", "<leader>qq")

vim.keymap.set("n", "<leader>c", function()
  Snacks.bufdelete()
end)
vim.keymap.set("n", "<leader>bw", function()
  Snacks.bufdelete.other()
end)

vim.keymap.set("n", "<leader>/", "gcl", { remap = true })

vim.keymap.set("x", "<leader>/", "gc", { remap = true })

vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
  if modified then
    vim.ui.input({
      prompt = "You have unsaved changes. Quit anyway? (y/n) ",
    }, function(input)
      if input == "y" then
        vim.cmd "q!"
      end
    end)
  else
    vim.cmd "q!"
  end
end, { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all without saving" })
vim.keymap.set("n", "<leader>Ls", "<cmd>Lazy sync<cr>", { desc = "Sync" })
vim.keymap.set("n", "<leader>LL", "<cmd>Lazy home<cr>", { desc = "Home" })
vim.keymap.set("n", "<leader>Lu", "<cmd>Lazy update<cr>", { desc = "Update" })
vim.keymap.set("n", "<leader>Li", "<cmd>Lazy install<cr>", { desc = "Install" })
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
vim.keymap.set("n", "<leader>lj", function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>lk", function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = "Prev Diagnostic" })

vim.keymap.set("n", "<leader>ll", vim.lsp.codelens.run, { desc = "CodeLens Action" })
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>so", "<cmd>so%<cr>", { desc = "Source lua file" })

vim.keymap.set("i", "jk", "<ESC>", { desc = "Quit insert mode" })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Quit insert mode" })
vim.keymap.set("i", "jj", "<ESC>", { desc = "Quit insert mode" })

vim.keymap.set("n", "<A-Up>", "<cmd>resize -2<CR>", { desc = "Resize up window" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize +2<CR>", { desc = "Resize down window" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize left window" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize right window" })

vim.keymap.set("n", "<C-q>", "<cmd>QuickFixToggle<CR>", { desc = "Toggle quickfix list" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down one page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up one page" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Jump to next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Jump to previous match" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Jump to next match" })

vim.keymap.set("n", "dh", "<cmd>diffget //2<CR>", { desc = "Choose left diff" })
vim.keymap.set("n", "dl", "<cmd>diffget //3<CR>", { desc = "Choose right diff" })

vim.keymap.set(
  "n",
  "<leader>8",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "Replace all occurrences of word" }
)

vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Move cursor to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Move cursor to down window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Move cursor to up window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Move cursor to right window" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overriding current register" })

-- vim.keymap.set("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"')
-- vim.keymap.set("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"')
--

-- formatting
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  LazyVim.format { force = true }
end, { desc = "Format" })

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map "<leader>th"
end

vim.keymap.set("n", "<leader>Ll", function()
  LazyVim.news.changelog()
end, { desc = "LazyVim Changelog" })

vim.keymap.set("n", "<leader>yf", function()
  local Path = require "plenary.path"
  local path = Path:new(vim.fn.expand "%")
  local relative_to_cwd = path:make_relative()
  vim.fn.setreg("+", relative_to_cwd)
  vim.notify("Copied relative path to clipboard: " .. relative_to_cwd, vim.log.levels.INFO)
end, {
  desc = "Copy relative file path to clipboard",
})
