custom_nvim = {
  nvimtree = {
    side = "left", -- can be left or right
    setup = {
      view = {
        mappings = {
          list = {},
        },
      },
    },
  },
  which_key = {
    mappings = {},
  },
  format_on_save = {
    enable = true,
  },
  lsp = {
    capabilities = nil,
    use_typescript_tools = false,
    code_lens = true,
  },
  colorscheme = "onedark",
  enable_codeium = false,
  enable_copilot = false,
  enable_chatgpt = false,
  enable_inlayHints = true,
  silicon_screenshots = {
    font = "CaskaydiaCove Nerd Font=34",
    theme = "OneHalfDark",
    to_clipboard = true,
    background = "#16191F",
    shadow_blur_radius = 0,
  },
}
