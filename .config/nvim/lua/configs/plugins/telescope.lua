return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 
    'nvim-lua/plenary.nvim' 
  },
  config = function()
    require("telescope").setup({
	    pickers = {
		    fd = {
			    theme = "cursor",
		    },
		    neopclip = {
			    theme = "dropdown",
		    },
		    cheatsheet = {
			    theme = "dropdown",
		    },
		    commands = {
			    theme = "dropdown",
		    },
		    command_history = {
			    theme = "dropdown",
		    },
		    buffers = {
			    theme = "cursor",
		    },
		    diagnostics = {
			    theme = "dropdown",
		    },
		    search_history = {
			    theme = "dropdown",
		    },
      },
    })

    vim.keymap.set('n', '<leader>tt', "<cmd>Telescope<CR>")
    end
}
