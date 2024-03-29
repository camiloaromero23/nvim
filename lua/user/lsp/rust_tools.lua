local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
  return
end

local M = {}

M.setup_rust_tools = function(capabilities, on_attach)
  rust_tools.setup {
    tools = {
      executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
      reload_workspace_from_cargo_toml = true,
      autoSetHints = true,
      runnables = {
        use_telescope = true,
      },
      inlay_hints = {
        auto = false,
        only_current_line = false,
        show_parameter_hints = true,
        parameter_hints_prefix = "<-",
        other_hints_prefix = "=>",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = "Comment",
      },
      hover_actions = {
        border = {
          { "╭", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╮", "FloatBorder" },
          { "│", "FloatBorder" },
          { "╯", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╰", "FloatBorder" },
          { "│", "FloatBorder" },
        },
        auto_focus = false,
      },
    },
    server = {
      on_attach = on_attach,
      capabilities = capabilities,
      standalone = false,
    },
  }
end
return M
