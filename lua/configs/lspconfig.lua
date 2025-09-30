require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 

-- Neovim 0.11+ LSP setup without require('lspconfig')

-- Capabilities (cmp integration)
local capabilities = vim.lsp.protocol.make_client_capabilities()
pcall(function()
  local cmp = require("cmp_nvim_lsp")
  capabilities = vim.tbl_deep_extend("force", capabilities, cmp.default_capabilities())
end)

-- Global diagnostics: show after InsertLeave
vim.diagnostic.enable()
vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = true,  -- set true if you prefer inline text
  underline = true,
  signs = true,
  severity_sort = true,
})

-- Optional: your on_attach (keymaps, etc.)
local function on_attach(client, bufnr)
  -- example keymaps:
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end
  map("n", "gd", vim.lsp.buf.definition, "LSP: Goto Definition")
  map("n", "gr", vim.lsp.buf.references, "LSP: References")
  map("n", "K",  vim.lsp.buf.hover, "LSP: Hover")
end

-- Extend the built-in clangd config from nvim-lspconfig
vim.lsp.config("clangd", {
  -- only override what you need; the rest comes from nvim-lspconfig's lsp/clangd.lua
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",                -- leave ON unless you switch to nvim-lint clangtidy
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--fallback-style=LLVM",
  },
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Finally, enable it (activates for its filetypes)
vim.lsp.enable("clangd")

