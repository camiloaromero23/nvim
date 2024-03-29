local ok, autopairs = pcall(require, "nvim-autopairs")

if not ok then
  return
end

local rule_ok, Rule = pcall(require, "nvim-autopairs.rule")
if not rule_ok then
  return
end

autopairs.setup {
  ---@usage  modifies the function or method delimiter by filetypes
  map_char = {
    all = "(",
    tex = "{",
  },
  ---@usage check bracket in same line
  enable_check_bracket_line = false,
  ---@usage check treesitter
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
  enable_moveright = true,
  ---@usage disable when recording or executing a macro
  disable_in_macro = false,
  ---@usage add bracket pairs after quote
  enable_afterquote = true,
  ---@usage map the <BS> key
  map_bs = true,
  ---@usage map <c-w> to delete a pair if possible
  map_c_w = false,
  ---@usage disable when insert after visual block mode
  disable_in_visualblock = false,
  ---@usage  change default fast_wrap
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
  },
}

local ts_conds = require "nvim-autopairs.ts-conds"

-- TODO: can these rules be safely added from "config.lua" ?
-- press % => %% is only inside comment or string
autopairs.add_rules {
  Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
  Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
}

pcall(function()
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  local _, cmp = pcall(require, "cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  -- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
end)
