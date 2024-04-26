return {
  'sudormrfbin/cheatsheet.nvim',
  keys = {
    { "<leader>?", "<cmd>Cheatsheet<cr>" },
  },
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require("cheatsheet").setup()
  end
}
