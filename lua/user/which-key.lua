custom_nvim.which_key.opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
custom_nvim.which_key.vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

which_key.setup {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ...
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = false, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
    spelling = { enabled = true, suggestions = 20 }, -- use which-key for spelling hints
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    mappings = false, -- set to false to disable all mapping icons, both those explicitely added in a mapping and those from rules
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  show_help = false, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  spec = {
    {
      mode = { "n", "v" },
      { "<leader>l", group = "LSP" },
      { "<leader>s", group = "Search" },
      { "<leader>t", group = "Test" },
      { "<leader>T", group = "Treesitter" },
      { "<leader>b", group = "Buffers" },
      { "<leader>L", group = "Lazy" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>g", group = "Git" },
      { "<leader>D", group = "Dependencies manager 📦" },
      { "<leader>m", group = "Markdown" },
    },
    {
      mode = "n",
      { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
      { "<leader>q", "<cmd>lua require('user.utils.functions').smart_quit()<CR>", desc = "Quit" },
      { "<leader>Q", "<cmd>qa!<CR>", desc = "Quit all without saving" },
      { "<leader>Ls", "<cmd>Lazy sync<cr>", desc = "Sync" },
      { "<leader>LL", "<cmd>Lazy home<cr>", desc = "Home" },
      { "<leader>Lu", "<cmd>Lazy update<cr>", desc = "Update" },
      { "<leader>8", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Replace all occurrences of word" },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      { "<leader>lf", "<cmd>lua require('user.lsp.utils').format { timeout_ms = 2000 }<cr>", desc = "Format" },
      {
        "<leader>lj",
        function()
          vim.diagnostic.jump { count = 1, float = true }
        end,
        desc = "Next Diagnostic",
      },
      {
        "<leader>lk",
        function()
          vim.diagnostic.jump { count = -1, float = true }
        end,
        desc = "Prev Diagnostic",
      },
      { "<leader>ll", vim.lsp.codelens.run, desc = "CodeLens Action" },
      { "<leader>lq", vim.diagnostic.setqflist, desc = "Quickfix" },
      { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
      { "<leader>so", "<cmd>so%<cr>", desc = "Source lua file" },
    },
    -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
    -- see https://neovim.io/doc/user/map.html#:map-cmd
    {
      mode = "v",
      {
        "<leader>lf",
        ":lua require('user.lsp.utils').format_selection()<CR>",
        desc = "Format selection",
      },
    },
  },
}
