local builtin = require "telescope.builtin"
local utils = require "telescope.utils"

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

return M
