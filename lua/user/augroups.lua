local M = {}

local augroup = vim.api.nvim_create_augroup

M.autoformat = augroup("AutoFormat", { clear = true })
M.autorun = augroup("AutoRun", { clear = true })
M.autotex = augroup("AutoTex", { clear = true })
M.general_settings = augroup("GeneralSettings", { clear = true })
M.lspDocumentHighlight = augroup("lsp_document_highlight", { clear = true })
M.noNewLineComments = augroup("NoNewLineComments", { clear = true })
M.winbar = augroup("_WinBar", { clear = true })
M.inlayHints = augroup("LspAttachInlayHints", { clear = true })

return M
