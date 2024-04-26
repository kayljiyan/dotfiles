return {
  "nocksock/do.nvim",
  config = function()
    require("do").setup({
      message_timeout = 2000,
      kaomoji_mode = 0,
      winbar = true,
      doing_prefix = "Doing: ",
      store = {
        auto_create_file = true,
        file_name = ".do_tasks",
      }
    })

    vim.keymap.set("n", "<leader>do", "<cmd>DoEdit<CR>")
    vim.keymap.set("n", "<leader>ds", "<cmd>DoSave<CR>")
    vim.keymap.set("n", "<leader>dn", "<cmd>Done!<CR>")
  end
}
