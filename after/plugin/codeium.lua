if custom_nvim.enable_codeium == false then
  return
end
vim.g.codeium_disable_bindings = 1

local keymappings = require "user.keymappings.utils"

keymappings.set_keymaps("i", "<C-g>", {
  vim.fn["codeium#Accept"],
  { expr = true },
})

keymappings.set_keymaps("i", "<c-,>", function()
  vim.fn["codeium#CycleCompletions"](-1)
end)

keymappings.set_keymaps("i", "<c-x>", function()
  vim.fn["codeium#Clear"]()
end)

keymappings.set_keymaps("i", "<c-;>", function()
  vim.fn["codeium#CycleCompletions"](1)
end)
