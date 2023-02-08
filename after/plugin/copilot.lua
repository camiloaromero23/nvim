if custom_nvim.enable_copilot == false then
  return
end

vim.g.copilot_no_tab_map = true
-- vim.g.copilot_node_command = "$FNM_DIR/aliases/lts-latest/bin/node"

vim.cmd [[ imap <silent><script><expr> kk copilot#Accept("") ]]
