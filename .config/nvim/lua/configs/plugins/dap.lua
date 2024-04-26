return {
  "rcarriga/nvim-dap-ui",
  keys = { "<leader>db", "<cmd>DapToggleBreakpoint<cr>" },
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    'theHamsta/nvim-dap-virtual-text',
    'mfussenegger/nvim-dap-python',
    'leoluz/nvim-dap-go',
  },
  config = function()
    require("nvim-dap-virtual-text").setup()
    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
    require('dap-go').setup()

    local dapui = require("dapui")
    dapui.setup()

    local dap = require("dap")
    local home = vim.env.HOME

    dap.adapters.coreclr = {
      type = 'executable',
      command = string.format('%s/netcoredbg/netcoredbg', home),
      args = { '--interpreter=vscode' }
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
        end,
      },
    }


    vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<cr>")
    vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dapui').open({reset=true})<cr>")
    vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>")
    vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>")
  end
}
