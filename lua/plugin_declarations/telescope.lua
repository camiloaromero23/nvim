return {
  {
    "nvim-telescope/telescope.nvim",
    -- version = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local telescope = require "telescope"
      local actions = require "telescope.actions"

      telescope.setup {
        defaults = {
          file_ignore_patterns = { "%.git/." },
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { shorten = 5 },
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "horizontal",

          layout_config = {
            width = 0.85,
            preview_cutoff = 120,
            horizontal = {
              preview_width = function(_, cols, _)
                if cols < 120 then
                  return math.floor(cols * 0.5)
                end
                return math.floor(cols * 0.6)
              end,
              mirror = false,
            },
            vertical = { mirror = false },
          },
          preview = {
            timeout_hook = function(filepath, bufnr, opts)
              local max_bytes = 1000
              local cmd = { "head", "-c", max_bytes, filepath }
              require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
            end,
            filesize_hook = function(filepath, bufnr, opts)
              local max_bytes = 1000
              local cmd = { "head", "-c", max_bytes, filepath }
              require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
            end,
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
          },
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,

              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,

              ["<C-c>"] = actions.close,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<C-l>"] = actions.complete_tag,
              ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["gg"] = actions.move_to_top,
              ["G"] = actions.move_to_bottom,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["?"] = actions.which_key,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
          live_grep = {
            --@usage don't include the filename in the search results
            only_sort_text = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
          file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            hidden = true,
            respect_gitignore = false,
            git_status = false,
          },

          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            },
          },
          package_info = {
            -- Optional theme (the extension doesn't set a default theme)
            -- theme = "ivy",
          },
        },
      }

      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "projects")
      pcall(telescope.load_extension, "ui-select")
      pcall(telescope.load_extension, "file_browser")
    end,
    keys = {
      {
        "<leader>sb",
        "<cmd>Telescope git_branches<cr>",
        desc = "Checkout branch",
      },
      {
        "<leader>sC",
        "<cmd>Telescope colorscheme<cr>",
        desc = "Colorscheme",
      },
      {
        "<leader>sf",
        "<cmd>Telescope find_files<cr>",
        desc = "Find File",
      },
      {
        "<leader>sF",
        "<cmd>Telescope file_browser<cr>",
        desc = "Telescope File Browser",
      },
      {
        "<leader>sd",
        "<cmd>lua require('user.telescope.custom-finders').grep_current_directory()<cr>",
        desc = "Grep in cwd",
      },
      {
        "<leader>sD",
        "<cmd>lua require('user.telescope.custom-finders').find_current_working_directory_file()<cr>",
        desc = "Find file in cwd",
      },
      {
        "<leader>se",
        "<cmd>lua require('user.telescope.custom-finders').find_env_files()<cr>",
        desc = "Find .env files",
      },
      {
        "<leader>sh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Find Help",
      },
      {
        "<leader>sH",
        "<cmd>Telescope highlights<cr>",
        desc = "Find highlight groups",
      },
      {
        "<leader>sM",
        "<cmd>Telescope man_pages<cr>",
        desc = "Man Pages",
      },
      {
        "<leader>sr",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Open Recent File",
      },
      {
        "<leader>sR",
        "<cmd>Telescope registers<cr>",
        desc = "Registers",
      },
      {
        "<leader>st",
        "<cmd>Telescope live_grep<cr>",
        desc = "Text",
      },
      {
        "<leader>sk",
        "<cmd>Telescope keymaps<cr>",
        desc = "Keymaps",
      },
      {
        "<leader>sc",
        "<cmd>Telescope commands<cr>",
        desc = "Commands",
      },
      {
        "<leader>bf",
        "<cmd>Telescope buffers<cr>",
        desc = "Find",
      },
      {
        "<leader>sp",
        "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
        desc = "Colorscheme with Preview",
      },
      {
        "<leader>so",
        "<cmd>so%<cr>",
        desc = "Source lua file",
      },
      {
        "<leader>f",
        "<cmd>lua require('user.telescope.custom-finders').find_project_files()<cr>",
        desc = "Find File",
      },
      {
        "<leader>go",
        function()
          require("user.telescope.custom-finders").delta_git_status()
        end,
        desc = "Open changed file",
      },
      {
        "<leader>gb",
        "<cmd>Telescope git_branches<cr>",
        desc = "Checkout branch",
      },
      {
        "<leader>gc",
        "<cmd>Telescope git_commits<cr>",
        desc = "Checkout commit",
      },
      {
        "<leader>gC",
        "<cmd>Telescope git_bcommits<cr>",
        desc = "Checkout commit (for current file)",
      },
      {
        "<leader>ld",
        "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>",
        desc = "Buffer Diagnostics",
      },
      {
        "<leader>lw",
        "<cmd>Telescope diagnostics<cr>",
        desc = "Diagnostics",
      },
      {
        "<leader>ls",
        "<cmd>Telescope lsp_document_symbols<cr>",
        desc = "Document Symbols",
      },
      {
        "<leader>lS",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        desc = "Workspace Symbols",
      },
      {
        "<leader>le",
        "<cmd>Telescope quickfix<cr>",
        desc = "Telescope Quickfix",
      },
    },
  },
  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable "make" == 1,
    lazy = true,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
  },
  { "nvim-telescope/telescope-ui-select.nvim", lazy = true },
}
