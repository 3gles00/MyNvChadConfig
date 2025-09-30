return {
  -- Override/extend gitsigns (already included by NvChad)
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      -- uncomment to add handy mappings:
      -- on_attach = function(buf)
      --   local gs = package.loaded.gitsigns
      --   vim.keymap.set("n", "]h", gs.next_hunk, { buffer = buf, desc = "Next hunk" })
      --   vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = buf, desc = "Prev hunk" })
      --   vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = buf, desc = "Stage hunk" })
      --   vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = buf, desc = "Reset hunk" })
      -- end,
    },
  },

  -- Pick ONE of these UIs (or install both):

  -- 1) Fugitive: classic :Git commands inside Neovim
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
  },

  -- 2) Neogit: Magit-like UI
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" }, -- diff view optional
    opts = {}, -- use defaults
  },

  -- 3) LazyGit: floating TUI (requires lazygit installed on your system)
  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
