local M = {}

local augroup = vim.api.nvim_create_augroup
M.general_settings = augroup("GeneralSettings", { clear = true })
M.noNewLineComments = augroup("NoNewLineComments", { clear = true })
M.autoformat = augroup("AutoFormat", { clear = true })
M.lspDocumentHighlight = augroup("lsp_document_highlight", {})
return M
