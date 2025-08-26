return {
  "Kicamon/yazi.nvim",
  -- lazy = true,
  cmd = "Yazi",
  config = function()
    require('yazi').setup()
  end,
  keys = {
      { "<leader><leader>", ":Yazi<CR>", silent = true },
      { "<leader>ya", ":Yazi tabe<CR>", silent = true },
      { "<leader>yh", ":Yazi left<CR>", silent = true },
      { "<leader>yj", ":Yazi down<CR>", silent = true },
      { "<leader>yk", ":Yazi up<CR>", silent = true },
      { "<leader>yl", ":Yazi right<CR>", silent = true },
  },
}
