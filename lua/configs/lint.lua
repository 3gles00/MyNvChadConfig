-- nvim-lint: cpplint (style) with updates on open/save/InsertLeave
-- Install cpplint:  pip install --user cpplint
local lint = require("lint")

lint.linters_by_ft = {
  c   = { "cpplint" },
  cpp = { "cpplint" },
}

-- Run linter when you enter buffer, save, or leave Insert
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  callback = function() pcall(lint.try_lint) end,
})

