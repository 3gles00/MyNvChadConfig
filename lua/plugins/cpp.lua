return {
  -- LSP: load our config that uses vim.lsp.config / vim.lsp.enable
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  }, 

  -- DAP core + UI (+ required nvim-nio)
  { "mfussenegger/nvim-dap", event = "VeryLazy" },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio", -- required by dap-ui
    },
    config = function() require("configs.dap") end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    opts = { ensure_installed = { "codelldb" }, automatic_setup = true },
  },

  -- Lint
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function() require("configs.lint") end,
  },

  -- Format (clang-format via none-ls)
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("configs.none-ls") end,
  },
}

