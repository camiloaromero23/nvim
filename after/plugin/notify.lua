local ok, notify = pcall(require, "notify")
if not ok then
  return
end

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
