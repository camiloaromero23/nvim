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
    ---@type "none"|"single"|"double"|"shadow"
    border = "none", -- none, single, double, shadow
  },
  format_on_save = {
    ---@type boolean
    enable = false,
    ---@type table
    opts = {
      ---@type "never"|"always"|"fallback"|"first"|"last"
      lsp_format = "fallback",
      ---@type nil|integer
      timeout_ms = 500,
    },
  },
  lsp = {
    ---@type lsp.ClientCapabilities
    capabilities = nil,
    ---@type boolean
    use_typescript_tools = false,
    ---@type boolean
    code_lens = true,
    ---@type string[]
    tailwindcss_class_attributes = {
      "class",
      "className",
      "ngClass",
      "class:list",
    },
  },
  ---@type "onedark"|"catppuccin"|"hybrid"|"tokyonight"
  colorscheme = "onedark",
  ---@type boolean
  enable_codeium = false,
  ---@type boolean
  enable_copilot = false,
  ---@type boolean
  enable_supermaven = false,
  ---@type boolean
  enable_chatgpt = false,
  ---@type boolean
  enable_inlayHints = true,
  ---@type boolean
  enable_obsidian = false,
  silicon_screenshots = {
    font = "CaskaydiaCove Nerd Font=34",
    theme = "OneHalfDark",
    to_clipboard = true,
    background = "#16191F",
    shadow_blur_radius = 0,
  },
}
