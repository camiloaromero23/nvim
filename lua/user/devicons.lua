local ok, devicons = pcall(require, "nvim-web-devicons")
if not ok then
  return
end

local colors = {
  angularRed = "#dd1b16",
  cssBlue = "#029ae6",
  eslintPurple = "#472FB9",
  gitignoreRed = "#fc3404",
  htmlRed = "#e34c26",
  jsYellow = "#f7df1e",
  luaBlue = "#51a0cf",
  packageJsonGreen = "#75bb39",
  scssPink = "#f55385",
  teal = "#04bbcb",
  tsBlue = "#3178c6",
  txtBlue = "#05a8fa",
  vueGreen = "#42B883",
  white = "#FFFFFF",
}

local custom_icons = {
  astro = {
    icon = "",
    color = colors.white,
    name = "astro",
  },
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
    icon = "󰌞",
    color = colors.jsYellow,
    cterm_color = "185",
    name = "js",
  },
  markdown = {
    icon = "",
    color = colors.white,
    name = "markdown",
  },
  scss = {
    icon = "",
    color = colors.scssPink,
    cterm_color = "204",
    name = "Scss",
  },
  ts = {
    icon = "󰛦",
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
    icon = "",
    color = colors.txtBlue,
    cterm_color = "67",
    name = "txt",
  },

  vue = {
    icon = "󰡄",
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
    color = colors.teal,
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
    color = colors.teal,
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
  ["tailwind.config.js"] = {
    icon = "󱏿",
    color = colors.teal,
    name = "tailwind",
  },
  [".editorconfig"] = {
    icon = "",
    color = colors.white,
    name = "editorconfig",
  },
  [".luacheckrc"] = {
    icon = "",
    color = colors.luaBlue,
    name = "luacheckrc",
  },
  [".eslintrc"] = {
    icon = "󰱺",
    color = colors.eslintPurple,
    name = "eslint",
  },
  ["Jenkinsfile"] = {
    icon = "",
    color = colors.white,
    name = "JenkinsFile",
  },
}

custom_icons["cy.ts"] = custom_icons["test.ts"]
custom_icons["component.tsx"] = custom_icons.tsx
custom_icons["styles.tsx"] = custom_icons.tsx
custom_icons["styles.ts"] = custom_icons.ts
custom_icons["tsconfig.json"] = custom_icons.ts
custom_icons["config.js"] = custom_icons.js
custom_icons["module.ts"] = custom_icons["angular.json"]
custom_icons["package-lock.json"] = custom_icons["package.json"]
custom_icons["spec.tsx"] = custom_icons["spec.jsx"]
custom_icons["test.tsx"] = custom_icons["test.jsx"]
custom_icons["tailwind.config.cjs"] = custom_icons["tailwind.config.js"]
custom_icons["tailwind.config.ts"] = custom_icons["tailwind.config.js"]
custom_icons["module.scss"] = custom_icons.scss
custom_icons[".nvmrc"] = custom_icons["package.json"]
custom_icons[".eslintrc.js"] = custom_icons[".eslintrc"]
custom_icons[".eslintOverrides.js"] = custom_icons[".eslintrc"]
custom_icons[".eslintignore"] = custom_icons[".eslintrc"]
custom_icons[".env.example"] = custom_icons[".env"]
custom_icons[".env.dev"] = custom_icons[".env"]
custom_icons[".env.test"] = custom_icons[".env"]

devicons.setup {
  override = custom_icons,
}
