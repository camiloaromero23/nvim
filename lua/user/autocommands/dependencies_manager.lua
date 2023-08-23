local augroups = require "user.augroups"

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroups.packageUtils,
  pattern = "Cargo.toml",
  callback = function()
    local crates_keymaps = {
      normal_mode = {
        ["<leader>Do"] = { "<cmd>lua require('crates').show_popup()<CR>", { desc = "Show popup" } },
        ["<leader>Dr"] = { "<cmd>lua require('crates').reload()<CR>", { desc = "Reload" } },
        ["<leader>Dv"] = { "<cmd>lua require('crates').show_versions_popup()<CR>", { desc = "Show Versions" } },
        ["<leader>Df"] = { "<cmd>lua require('crates').show_features_popup()<CR>", { desc = "Show Features" } },
        ["<leader>Dd"] = {
          "<cmd>lua require('crates').show_dependencies_popup()<CR>",
          { desc = "Show Dependencies Popup" },
        },
        ["<leader>Du"] = { "<cmd>lua require('crates').update_crate()<CR>", { desc = "Update Crate" } },
        ["<leader>Da"] = { "<cmd>lua require('crates').update_all_crates()<CR>", { desc = "Update All Crates" } },
        ["<leader>DU"] = { "<cmd>lua require('crates').upgrade_crate<CR>", { desc = "Upgrade Crate" } },
        ["<leader>DA"] = { "<cmd>lua require('crates').upgrade_all_crates(true)<CR>", { desc = "Upgrade All Crates" } },
        ["<leader>DH"] = { "<cmd>lua require('crates').open_homepage()<CR>", { desc = "Open Homepage" } },
        ["<leader>DR"] = { "<cmd>lua require('crates').open_repository()<CR>", { desc = "Open Repository" } },
        ["<leader>DD"] = { "<cmd>lua require('crates').open_documentation()<CR>", { desc = "Open Documentation" } },
        ["<leader>DC"] = { "<cmd>lua require('crates').open_crates_io()<CR>", { desc = "Open Crate.io" } },
      },
    }

    local keymappings = require "user.keymappings.utils"

    for mode, mapping in pairs(crates_keymaps) do
      keymappings.load_mode(mode, mapping)
    end
  end,
})

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
