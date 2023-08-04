return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require "notify"
    notify.setup {
      stages = "slide",
      timeout = 1500,
      fps = 60,
      background_colour = "#1e222a",
      icons = {
        ERROR = " ",
        WARN = " ",
        INFO = " ",
        DEBUG = " ",
        TRACE = " ",
      },
    }
    vim.notify = notify
  end,
}
