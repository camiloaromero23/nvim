local lsp = require "user.lsp.utils"

local M = {}

local lsp_mappings = {
  normal_mode = {
    ["K"] = { lsp.hover, "Show hover" },
    -- ["K"] = { vim.lsp.buf.hover, "Show hover" },
    ["gd"] = { vim.lsp.buf.definition, "Goto Definition" },
    ["gD"] = { vim.lsp.buf.declaration, "Goto declaration" },
    ["gr"] = { vim.lsp.buf.references, "Goto references" },
    ["gI"] = { vim.lsp.buf.implementation, "Goto Implementation" },
    ["gs"] = { vim.lsp.buf.signature_help, "show signature help" },
    -- ["gp"] = {
    --   function()
    --     require("lvim.lsp.peek").Peek "definition"
    --   end,
    --   "Peek definition",
    -- },
    ["gl"] = {
      function()
        local config = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
          format = function(d)
            local code = d.code or (d.user_data and d.user_data.lsp.code)
            if code then
              return string.format("%s [%s]", d.message, code):gsub("1. ", "")
            end
            return d.message
          end,
        }
        config.scope = "line"
        vim.diagnostic.open_float(config)
      end,
      "Show line diagnostics",
    },
  },
  insert_mode = {},
  visual_mode = {},
}
local lsp_modes = {
  normal_mode = "n",
  insert_mode = "i",
  visual_mode = "v",
}

M.set_lsp_keymaps = function(bufnr)
  for mode_name, mode_char in pairs(lsp_modes) do
    for key, remap in pairs(lsp_mappings[mode_name]) do
      local opts = { buffer = bufnr, desc = remap[2], noremap = true, silent = true }
      vim.keymap.set(mode_char, key, remap[1], opts)
    end
  end
end

return M
