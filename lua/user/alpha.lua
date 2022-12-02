local M = {}

local header = {
    "                        :=                        ",
    "                       +@@@                       ",
    "                      .%@@@:                      ",
    "                 ...::-@@@%::::...                ",
    "              .-----====#*+++=----=               ",
    "              .-----####*=###=-----               ",
    "               =----#########=----:        -:     ",
    "     +*.       -----**+-+****----=        +@-     ",
    "     -@@#@%*==++++*#*=-----=+*++++-::-+++%@@:     ",
    "      *@@@@@@@@@**%*#@#=-+%@%%%*#@@@@@@@@@@%      ",
    "       *@@@@@@@@%+- -.-=-= =. #-%@@@@@@@@@@+      ",
    "        .=#%@@@@+=*=*+:--=+%%**-+@@@@@@%+-        ",
    "             :-=--=*#++**#%#+@#+#*+-:.            ",
    "                 :@%###+*+===*@*                  ",
    "                 -@%**+=+=+**#%:                  ",
    "                  :%@@@@@@@@@#.                   ",
    "                    =@#@@@#@+                     ",
    "                      . =* .                      ",
}

local buttons = {
  entries = {
    { "SPC f", "  Find File", "<CMD>Telescope find_files<CR>" },
    { "SPC n", "  New File", "<CMD>ene!<CR>" },
    { "SPC P", "  Recent Projects ", "<CMD>Telescope projects<CR>" },
    { "SPC s r", "  Recently Used Files", "<CMD>Telescope oldfiles<CR>" },
    { "SPC s t", "  Find Word", "<CMD>Telescope live_grep<CR>" },
    -- {
    --   "SPC L c",
    --   "  Configuration",
    --   "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
    -- },
  },
}

local ok, alpha = pcall(require,"alpha")
if not ok then
  return
end

local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = header

dashboard.section.buttons.val = {
   dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
   dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
   dashboard.button( "c", "  Configuration", "<CMD>edit " .. "~/.config/nvim/init.lua" .. " <CR>")
}

local version = vim.version()

dashboard.section.footer.val = "NVIM" .. " v" .. version.major .. "." .. version.minor .. "." .. version.patch

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)
