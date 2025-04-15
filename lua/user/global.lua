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
  ---@type "bottom-left"|"bottom-right"|"bottom-center"|"top-left"|"top-right"|"top-center"
  showkeys_position = "bottom-right",
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
    -- font = "Geist Mono=34",
    theme = "Catppuccin Mocha",
    to_clipboard = true,
    background = "#11111B",
    shadow_blur_radius = 0,
  },
}
