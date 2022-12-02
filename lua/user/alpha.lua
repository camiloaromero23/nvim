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
  dashboard.button("SPC s f", "  Find File", "<CMD>Telescope find_files<CR>"),
  -- dashboard.button( "SPC s f", "  Find File", "<CMD>lua require('user.telescope.custom-finders').find_project_files()<CR>" ),
  -- dashboard.button( "SPC n", "  New file" , ":ene <BAR> startinsert <CR>"),
  dashboard.button("SPC P", "  Recent Projects ", "<CMD>Telescope projects<CR>"),
  dashboard.button("SPC s r", "  Recently Used Files", "<CMD>Telescope oldfiles<CR>"),
  dashboard.button("SPC s t", "  Find Word", "<CMD>Telescope live_grep<CR>"),
  dashboard.button("SPC L c", "  Configuration", "<CMD>edit " .. "~/.config/nvim/init.lua" .. " <CR>"),
}

local version = vim.version()

dashboard.section.footer.val = "NVIM" .. " v" .. version.major .. "." .. version.minor .. "." .. version.patch

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)
