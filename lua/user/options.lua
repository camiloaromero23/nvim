-- foldexpr = "nvim_treesitter#foldexpr()"
-- foldmethod = "expr"
-- foldmethod = "manual" -- folding set to "expr" for treesitter based folding
-- titlestring = "%<%F%=%l/%L - NVIM" -- what the title of the window will be set to
vim.o.backup = false -- creates a backup file
vim.o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
-- vim.o.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.o.cmdheight = 0 -- by default hide the command prompt (will be set up as 1 when after setting up lualine)
vim.o.colorcolumn = "99999" -- fixes indentline for now
vim.o.conceallevel = 0 -- so that `` is visible in markdown files
vim.o.cursorline = true -- highlight the current line
vim.o.expandtab = true -- convert tabs to spaces
vim.o.fileencoding = "utf-8" -- the encoding written to a file
vim.o.foldenable = false
vim.o.foldexpr = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.o.hidden = true -- required to keep multiple buffers and open multiple buffers
vim.o.hlsearch = false -- highlight all matches on previous search pattern
vim.o.ignorecase = true -- ignore case in search patterns
vim.o.laststatus = 0 -- by default hide the statusline (will be enabled when setting up lualine)
-- vim.o.laststatus = 3 -- always display the status line
vim.o.mouse = "a" -- allow the mouse to be used in neovim
vim.o.number = true -- set numbered lines
vim.o.numberwidth = 4 -- set number column width to 2 {default 4}
vim.o.pumheight = 10 -- pop up menu height
vim.o.relativenumber = true -- set relative numbered lines
vim.o.scrolloff = 8 -- is one of my fav
vim.o.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- vim.o.showtabline = 2 -- always show tabs
vim.o.sidescrolloff = 8
vim.o.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.o.smartcase = true -- smart case
vim.o.smartindent = true -- make indenting smarter again
vim.o.spell = false
vim.o.spelllang = "en"
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.swapfile = false -- creates a swapfile
vim.o.tabstop = 2 -- insert 2 spaces for a tab
vim.o.termguicolors = true -- set term gui colors (most terminals support this)
vim.o.timeoutlen = 250 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.title = true -- set the title of window to the value of the titlestring
vim.o.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.o.undofile = true -- enable persistent undo
vim.o.updatetime = 50 -- faster completion
vim.o.wrap = false -- display lines as one long line
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.isfname:append("@-@")
-- vim.opt.guicursor = "" -- use block cursor always

vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.iskeyword:append "-"
-- vim.opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
-- vim.opt.shortmess:append "I" -- don't show the default intro message

vim.cmd [[set formatoptions-=cro]]
