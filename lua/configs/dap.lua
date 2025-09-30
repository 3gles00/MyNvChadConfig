-- codelldb DAP + UI
local dap   = require("dap")
local dapui = require("dapui")

dapui.setup()

-- Auto-open/close UI with sessions
dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui"]     = function() dapui.close() end

-- Per-language launch templates (mason-nvim-dap sets the 'codelldb' adapter)
local function cfg(name)
  return {
    name = name or "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  }
end

dap.configurations.cpp = { cfg() }
dap.configurations.c   = dap.configurations.cpp

-- Handy keymaps (optional)
local map = vim.keymap.set
map("n", "<F5>",       function() dap.continue() end,           { desc = "DAP Continue" })
map("n", "<F10>",      function() dap.step_over() end,          { desc = "DAP Step Over" })
map("n", "<F11>",      function() dap.step_into() end,          { desc = "DAP Step Into" })
map("n", "<S-F11>",    function() dap.step_out() end,           { desc = "DAP Step Out" })
map("n", "<F9>",       function() dap.toggle_breakpoint() end,  { desc = "DAP Toggle Breakpoint" })
map("n", "<leader>du", function() dapui.toggle() end,           { desc = "DAP UI Toggle" })

