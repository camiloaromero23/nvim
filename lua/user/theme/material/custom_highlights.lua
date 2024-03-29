local colors = require "material.colors"

vim.api.nvim_set_hl(0, "rainbowcol1", { fg = "Gold" })
vim.api.nvim_set_hl(0, "rainbowcol2", { fg = "Orchid" })
vim.api.nvim_set_hl(0, "rainbowcol3", { fg = "LightSkyBlue" })
vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "gray", bg="#252525" })

return {
  IndentBlanklineContextChar = { fg = colors.fg },
  NavicIconsArray = { fg = colors.main.orange },
  NavicIconsBoolean = { fg = colors.main.green },
  NavicIconsClass = { fg = colors.main.yellow },
  NavicIconsConstant = { fg = colors.main.paleblue },
  NavicIconsConstructor = { fg = colors.main.purple },
  NavicIconsEnum = { fg = colors.main.darkyellow },
  NavicIconsEnumMember = { fg = colors.main.darkyellow },
  NavicIconsEvent = { fg = colors.main.darkred },
  NavicIconsField = { fg = colors.main.cyan },
  NavicIconsFile = { fg = colors.title },
  NavicIconsFunction = { fg = colors.main.blue },
  NavicIconsInterface = { fg = colors.main.yellow },
  NavicIconsKey = { fg = colors.main.cyan },
  NavicIconsMethod = { fg = colors.main.blue },
  NavicIconsModule = { fg = colors.title },
  NavicIconsNamespace = { fg = colors.main.yellow },
  NavicIconsNull = { fg = colors.main.red },
  NavicIconsNumber = { fg = colors.main.darkorange },
  NavicIconsObject = { fg = colors.main.orange },
  NavicIconsOperator = { fg = colors.main.red },
  NavicIconsPackage = { fg = colors.title },
  NavicIconsProperty = { fg = colors.main.purple },
  NavicIconsString = { fg = colors.main.darkorange },
  NavicIconsStruct = { fg = colors.main.yellow },
  NavicIconsTypeParameter = { fg = colors.main.darkgreen },
  NavicIconsVariable = { fg = colors.main.paleblue },
  NavicSeparator = { fg = colors.fg },
  NavicText = { fg = colors.fg },
  NvimTreeGitDirty = { fg = colors.main.green },
  NvimTreeGitNew = { fg = colors.main.green },
  NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
}
