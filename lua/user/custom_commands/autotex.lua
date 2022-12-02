local augroups = require "user.augroups"

local openPDF = function(filename)
  local command = "zathura " .. filename .. ".pdf"

  vim.fn.jobstart(command)
end

local autoCompilePDF = function(filename)
  local command = "pdflatex " .. filename .. ".tex"

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = augroups.autotex,
    pattern = "*.tex",
    callback = function()
      vim.fn.jobstart(command)
    end,
  })
end

vim.api.nvim_create_user_command("AutoTex", function()
  print "AutoTex running..."
  local mainFile = vim.fn.input "Enter Main File (without extension): "
  openPDF(mainFile)
  autoCompilePDF(mainFile)
end, {})
