local builtin = require "telescope.builtin"
local utils = require "telescope.utils"
local previewers = require "telescope.previewers"

local M = {}

-- Smartly opens either git_files or find_files, depending on whether the working directory is
-- contained in a Git repo.
function M.find_project_files()
  local ok = pcall(builtin.git_files)

  if not ok then
    builtin.find_files()
  end
end

function M.find_current_working_directory_file()
  builtin.find_files { cwd = utils.buffer_dir() }
end

function M.find_env_files()
  builtin.find_files { prompt_title = "Find .env files", search_file = "*.env*" }
end

function M.grep_current_directory()
  builtin.live_grep { cwd = utils.buffer_dir() }
end

M.delta_git_status = function(opts)
  opts = opts or {}

  if vim.fn.executable "delta" == 0 then
    vim.notify "delta is not installed, defaulting to builtin git_status"
    builtin.git_status(opts)
    return
  end

  opts.previewer = previewers.new_termopen_previewer {
    get_command = function(entry)
      if entry.status ~= "??" then
        return {
          "git",
          "-c",
          "delta.side-by-side=false",
          "-c",
          "delta.line-numbers=false",
          "-c",
          "delta.navigate=false",
          "-c",
          "delta.file-style=omit",
          "-c",
          "delta.hunk-header-style=omit",
          "diff",
          "HEAD",
          "--",
          entry.path,
        }
      end

      if vim.fn.executable "bat" == 0 then
        vim.notify "bat is not installed, defaulting to cat"
        return {
          "cat",
          entry.path,
        }
      end

      return {
        "bat",
        "--style=plain",
        "--paging=always",
        entry.path,
      }
    end,
  }

  builtin.git_status(opts)
end

return M
