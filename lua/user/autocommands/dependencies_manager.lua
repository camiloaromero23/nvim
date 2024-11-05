local augroups = require "user.augroups"

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroups.packageUtils,
  pattern = "package.json",
  callback = function()
    local telescope_ok, telescope = pcall(require, "telescope")

    if telescope_ok then
      pcall(telescope.load_extension, "package_info")
    end

    local crates_keymaps = {
      normal_mode = {
        ["<leader>Dt"] = { "<cmd>lua require('package-info').toggle()<CR>", { desc = "Toggle dependency versions" } },
        ["<leader>Du"] = { "<cmd>lua require('package-info').update()<CR>", { desc = "Update dependency on the line" } },
        ["<leader>Dd"] = { "<cmd>lua require('package-info').delete()<CR>", { desc = "Delete dependency on the line" } },
        ["<leader>Di"] = { "<cmd>lua require('package-info').install()<CR>", { desc = "Install a new dependency" } },
        ["<leader>Dp"] = {
          "<cmd>lua require('package-info').change_version()<CR>",
          { desc = "Install a different dependency version" },
        },
      },
    }

    local keymappings = require "user.keymappings.utils"

    for mode, mapping in pairs(crates_keymaps) do
      keymappings.load_mode(mode, mapping)
    end
  end,
})
