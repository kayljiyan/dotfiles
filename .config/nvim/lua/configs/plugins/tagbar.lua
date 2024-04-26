return {
  'preservim/tagbar',
  event = "BufEnter",
  config = function()
    vim.g.tagbar_width = 35
    vim.keymap.set({ "n", "i", "v" }, "<leader>tb", "<cmd>Tagbar<CR>")
  end
}
