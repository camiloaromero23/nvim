return {
  "echasnovski/mini.icons",
  lazy = true,
  opts = {
    file = {
      [".dockerignore"] = { glyph = "󰡨", hl = "MiniIconsBlue" },
      ["README.md"] = { glyph = "󰍔", hl = "MiniIconsGrey" },
      ["tsconfig.json"] = { glyph = "󰛦", hl = "MiniIconsAzure" },

      [".gitignore"] = { hl = "MiniIconsRed" },
      [".DS_Store"] = { hl = "MiniIconsGrey" },
    },
    extension = {
      -- Fonts
      otf = { glyph = "", hl = "MiniIconsGrey" },
      ttf = { glyph = "", hl = "MiniIconsGrey" },
      woff = { glyph = "", hl = "MiniIconsGrey" },
      woff2 = { glyph = "", hl = "MiniIconsGrey" },

      ["test.jsx"] = { glyph = "" },
      ["test.tsx"] = { glyph = "" },
    },
    filetype = {
      dotenv = { glyph = "", hl = "MiniIconsYellow" },
    },
    -- directory = {
    -- ["__tests__"] = { glyph = "󱞊", hl = "MiniIconsGreen" },
    -- },
  },
}
