local M = {}

local augroup = vim.api.nvim_create_augroup
M.autoformat = augroup("AutoFormat", { clear = true })
M.autorun = augroup("AutoRun", { clear = true })
M.autotex = augroup("AutoTex", { clear = true })
M.general_settings = augroup("GeneralSettings", { clear = true })
M.lspDocumentHighlight = augroup("lsp_document_highlight", {})
M.noNewLineComments = augroup("NoNewLineComments", { clear = true })
return M
