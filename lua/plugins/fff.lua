return {
  "dmtrKovalenko/fff.nvim",
  build = function()
    -- this will download prebuild binary or try to use existing rustup toolchain to build from source
    -- (if you are using lazy you can use gb for rebuilding a plugin if needed)
    require("fff.download").download_or_build_binary()
  end,
  -- if you are using nixos
  -- build = "nix run .#release",
  opts = {
    prompt = "  ",
    title = "Find Files",
    layout = {
      height = 0.8,
      width = 0.85,
      prompt_position = "bottom",
      preview_position = "right",
      preview_size = 0.6125,
      show_scrollbar = false,
    },
    preview = {
      enabled = true,
      line_numbers = false,
      wrap_lines = false,
    },
    keymaps = {
      close = "<Esc>",
      select = "<CR>",
      select_split = "<C-s>",
      select_vsplit = "<C-v>",
      select_tab = "<C-t>",
      move_up = { "<Up>", "<C-k>" },
      move_down = { "<Down>", "<C-j>", "<C-n>" },
      preview_scroll_up = "<C-u>",
      preview_scroll_down = "<C-d>",
      toggle_select = "<Tab>",
      send_to_quickfix = "<C-q>",
      cycle_previous_query = "<C-p>",
      toggle_grep_regex = "<S-Tab>",
    },
    hl = {
      border = "FloatBorder",
      normal = "NormalFloat",
      cursor = "CursorLine",
      matched = "IncSearch",
      title = "Title",
      prompt = "Question",
      scrollbar = "Comment",
      directory_path = "Comment",
      grep_match = "IncSearch",
      grep_line_number = "LineNr",
      grep_regex_active = "DiagnosticInfo",
      grep_plain_active = "Comment",
      grep_fuzzy_active = "DiagnosticHint",
    },
    debug = {
      enabled = true,
      show_scores = true,
    },
  },
  -- No need to lazy-load with lazy.nvim.
  -- This plugin initializes itself lazily.
  lazy = false,
  keys = {
    {
      "<leader>sf", -- try it if you didn't it is a banger keybinding for a picker
      function()
        require("fff").find_files()
      end,
      desc = "FFFind files",
    },
    {
      "<leader>st",
      function()
        require("fff").live_grep()
      end,
      desc = "Find Word",
    },
    {
      "<leader>sz",
      function()
        require("fff").live_grep {
          grep = {
            modes = { "fuzzy", "plain" },
          },
        }
      end,
      desc = "Live fffuzy grep",
    },
    {
      "<leader>*",
      function()
        require("fff").live_grep { query = vim.fn.expand "<cword>" }
      end,
      desc = "Search Current Word",
    },
  },
}
