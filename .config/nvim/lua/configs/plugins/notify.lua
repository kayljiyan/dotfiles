return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      timeout = 2000,
      stages = "slide",
    })

    vim.notify = require("notify")
  end
}
