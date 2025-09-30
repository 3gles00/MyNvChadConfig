-- clang-format on save via none-ls (a.k.a. null-ls client)
local null = require("null-ls")
local fmt  = null.builtins.formatting

null.setup({
  sources = {
    fmt.clang_format.with({
      filetypes = { "c", "cpp", "objc", "objcpp" },
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- One clean format-on-save hook that targets only the null-ls client
      local grp = vim.api.nvim_create_augroup("CppFormatOnSave", { clear = false })
      vim.api.nvim_clear_autocmds({ group = grp, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = grp,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            async = false,
            bufnr = bufnr,
            filter = function(c) return c.name == "null-ls" end,
          })
        end,
      })
    end
  end,
})

