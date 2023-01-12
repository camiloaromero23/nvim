local M = {}

M.config = function()
  local status_ok, colorizer = pcall(require, "colorizer")
  if not status_ok then
    return
  end
  colorizer.setup {
    filetypes = { "*", "!lazy" },
    user_default_options = {
      css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      hsl_fn = true, -- CSS hsl() and hsla() functions
      names = true, -- "Name" codes like Blue
      rgb_fn = true, -- CSS rgb() and rgba() functions
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      -- mode = "virtualtext",
      tailwind = true,
    },
  }
end

return M
