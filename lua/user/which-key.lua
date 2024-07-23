local which_key_opts = {
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
}

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
-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd
custom_nvim.which_key.vmappings = {
  l = {
    name = "LSP",
    f = {
      ":lua require('user.lsp.utils').format_selection()<CR>",
      "Format selection",
    },
  },
}

custom_nvim.which_key.mappings = {
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>lua require('user.utils.functions').smart_quit()<CR>", "Quit" },
  ["Q"] = { "<cmd>qa!<CR>", "Quit" },
  b = {
    name = "Buffers",
  },
  L = {
    name = "Lazy",
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    L = { "<cmd>Lazy home<cr>", "Home" },
    u = { "<cmd>Lazy update<cr>", "Update" },
  },
  h = {
    name = "Harpoon",
  },
  ["8"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace all occurences of word" },
  g = {
    name = "Git",
  },
  D = { name = "Dependencies manager 📦" },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    f = { "<cmd>lua require('user.lsp.utils').format { timeout_ms = 2000 }<cr>", "Format" },
    j = {
      function()
        vim.diagnostic.jump { count = 1, float = true }
      end,
      "Next Diagnostic",
    },
    k = {
      function()
        vim.diagnostic.jump { count = -1, float = true }
      end,
      "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    q = { vim.diagnostic.setqflist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
  },
  s = {
    name = "Search",
    o = {
      "<cmd>so%<cr>",
      "Source lua file",
    },
  },
  t = {
    name = "Test",
  },
  T = {
    name = "Treesitter",
  },
}

local ok, which_key = pcall(require, "which-key")
if not ok then
  return
end

which_key.setup(which_key_opts)
if not custom_nvim.which_key then
  return
end
local opts = custom_nvim.which_key.opts
local vopts = custom_nvim.which_key.vopts

local mappings = custom_nvim.which_key.mappings
local vmappings = custom_nvim.which_key.vmappings

which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
