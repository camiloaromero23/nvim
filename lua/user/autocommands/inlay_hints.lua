local augroups = require "user.augroups"

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroups.inlayHints,
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local server_has_inlay_hints = client.server_capabilities.inlayHintsProvider
      or client.server_capabilities.inlayHintProvider

    if custom_nvim.enable_inlayHints and server_has_inlay_hints then
      vim.lsp.buf.inlay_hint(0, true)
    end
  end,
})
