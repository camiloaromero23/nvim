local icons = require("user.icons").ui
local header = {
  "                                        ",
  "                 #######                ",
  "          ###    #######    ###         ",
  "       (######## ####### ########%      ",
  "        #########################       ",
  "          #####################         ",
  "    #################################   ",
  "    #################################   ",
  "    #################################   ",
  "          #####################         ",
  "        #########################       ",
  "       ######### ####### ########.      ",
  "          ###    #######    ###         ",
  "                 #######                ",
  "                                        ",
  "                                        ",
}

local ok, alpha = pcall(require, "alpha")
if not ok then
  return
end

local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = header
dashboard.section.header.opts.hl = "AlphaHeader"

dashboard.section.buttons.val = {
  dashboard.button("SPC s f", icons.FindFile .. "  Find File"),
  -- dashboard.button( "SPC n", "  New file" , ":ene <BAR> startinsert <cr>"),
  -- dashboard.button("SPC s P", icons.Project .. "  Recent Projects ", "<cmd>Telescope projects<cr>"),
  dashboard.button("SPC s r", "  Recently Used Files"),
  dashboard.button("SPC s t", icons.FindText .. "  Find Word"),
  dashboard.button("SPC C", "  Configuration", "<cmd>edit " .. "~/.config/nvim/init.lua" .. " <cr>"),
}

local version = vim.version() or {}

dashboard.section.footer.val = "NVIM" .. " v" .. version.major .. "." .. version.minor .. "." .. version.patch

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)
