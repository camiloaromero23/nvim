local ok, devicons = pcall(require, "nvim-web-devicons")
if not ok then
  return
end

local colors = {
  angularRed = "#dd1b16",
  cssBlue = "#029ae6",
  gitignoreRed = "#fc3404",
  htmlRed = "#e34c26",
  jsYellow = "#f7df1e",
  packageJsonGreen = "#75bb39",
  testTeal = "#04bbcb",
  tsBlue = "#3178c6",
  txtBlue = "#05a8fa",
  vueGreen = "#42B883",
}

local custom_icons = {
  css = {
    icon = "",
    color = colors.cssBlue,
    name = "css",
  },
  [".env"] = {
    icon = "",
    color = colors.jsYellow,
    name = "env",
  },
  html = {
    icon = "",
    color = colors.htmlRed,
    cterm_color = "166",
    name = "Html",
  },
  js = {
    icon = "",
    color = colors.jsYellow,
    cterm_color = "185",
    name = "js",
  },
  ts = {
    icon = "ﯤ",
    color = colors.tsBlue,
    cterm_color = "67",
    name = "ts",
  },
  tsx = {
    icon = "",
    color = colors.tsBlue,
    cterm_color = "67",
    name = "tsx",
  },
  txt = {
    icon = "",
    color = colors.txtBlue,
    cterm_color = "67",
    name = "txt",
  },

  vue = {
    icon = "﵂",
    cterm_color = "67",
    color = colors.vueGreen,
    name = "vue",
  },
  ["component.ts"] = {
    icon = "",
    color = colors.tsBlue,
    name = "componentts",
  },
  ["test.js"] = {
    icon = "",
    color = colors.jsYellow,
    name = "testJS",
  },
  ["test.ts"] = {
    icon = "",
    color = colors.tsBlue,
    name = "testTS",
  },
  ["test.jsx"] = {
    icon = "",
    color = colors.testTeal,
    name = "testJSX",
  },
  ["spec.js"] = {
    icon = "",
    color = colors.jsYellow,
    name = "testJS",
  },
  ["spec.ts"] = {
    icon = "",
    color = colors.tsBlue,
    name = "testTS",
  },
  ["spec.jsx"] = {
    icon = "",
    color = colors.testTeal,
    name = "testJSX",
  },
  ["angular.json"] = {
    icon = "",
    color = colors.angularRed,
    name = "angularjson",
  },
  ["package.json"] = {
    icon = "",
    color = colors.packageJsonGreen,
    name = "PackageJson",
  },
  [".gitignore"] = {
    icon = "",
    color = colors.gitignoreRed,
    name = "GitIgnore",
  },
}

custom_icons["component.tsx"] = custom_icons.tsx
custom_icons["styles.tsx"] = custom_icons.tsx
custom_icons["styles.ts"] = custom_icons.ts
custom_icons["config.js"] = custom_icons.js
custom_icons["module.ts"] = custom_icons["angular.json"]
custom_icons["package-lock.json"] = custom_icons["package.json"]
custom_icons["spec.tsx"] = custom_icons["spec.jsx"]
custom_icons["test.tsx"] = custom_icons["test.jsx"]

devicons.setup {
  override = custom_icons,
}
