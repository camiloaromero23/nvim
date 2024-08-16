return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-go",
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    config = function()
      local ok, neotest = pcall(require, "neotest")
      if not ok then
        return
      end

      neotest.setup {
        adapters = {
          require "neotest-go" {
            experimental = {
              test_table = true,
            },
            args = { "-count=1", "-timeout=60s" },
          },
          require "neotest-jest" {
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            ---@diagnostic disable-next-line: unused-local
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          },
          require "neotest-vitest",
        },
      }
    end,
    lazy = true,
    keys = {
      {
        "<leader>tt",
        "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",
        desc = "Run all tests",
      },
      {
        "<leader>tr",
        "<cmd>lua require('neotest').run.run()<cr>",
        desc = "Run nearest test",
      },
      -- {
      --   "<leader>ts",
      --   "<cmd>lua require('neotest').run.stop()<cr>",
      --   desc = "Stop current test",
      -- },
      -- {
      --   "<leader>ta",
      --   "<cmd>lua require('neotest').run.attach()<cr>",
      --   desc = "Attach to nearest test",
      -- },
      {
        "<leader>ts",
        "<cmd>lua require('neotest').summary.toggle()<cr>",
        desc = "Toggle tests summary",
      },
      {
        "<leader>to",
        "<cmd>lua require('neotest').output.open()<cr>",
        desc = "Open test output",
      },
    },
  },
}
