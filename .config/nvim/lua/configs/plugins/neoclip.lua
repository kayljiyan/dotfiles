return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    'nvim-telescope/telescope.nvim'
  },
  config = function()
    require('neoclip').setup()

    vim.keymap.set("n", "<leader>nc", "<cmd>Telescope neoclip<CR>")
  end
}
