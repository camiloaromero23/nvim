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

local ok, alpha = pcall(require, "alpha")
if not ok then
  return
end

local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = header

dashboard.section.buttons.val = {
  dashboard.button("SPC s f", "  Find File", "<cmd>Telescope find_files<cr>"),
  -- dashboard.button( "SPC s f", "  Find File", "<cmd>lua require('user.telescope.custom-finders').find_project_files()<cr>" ),
  -- dashboard.button( "SPC n", "  New file" , ":ene <BAR> startinsert <cr>"),
  dashboard.button("SPC P", "  Recent Projects ", "<cmd>Telescope projects<cr>"),
  dashboard.button("SPC s r", "  Recently Used Files", "<cmd>Telescope oldfiles<cr>"),
  dashboard.button("SPC s t", "  Find Word", "<cmd>Telescope live_grep<cr>"),
  dashboard.button("SPC L c", "  Configuration", "<cmd>edit " .. "~/.config/nvim/init.lua" .. " <cr>"),
}

local version = vim.version()

dashboard.section.footer.val = "NVIM" .. " v" .. version.major .. "." .. version.minor .. "." .. version.patch

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)
