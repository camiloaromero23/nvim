if custom_nvim.enable_copilot == false then
  return
end

vim.g.copilot_no_tab_map = true
-- vim.g.copilot_node_command = "/usr/local/n/versions/node/16.14.2/bin/node"

vim.cmd [[ imap <silent><script><expr> kk copilot#Accept("") ]]
