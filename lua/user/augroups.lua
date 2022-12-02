local M = {}

local augroup = vim.api.nvim_create_augroup
M.general_settings = augroup("GeneralSettings", { clear = true })
M.noNewLineComments = augroup("NoNewLineComments", { clear = true })
return M
