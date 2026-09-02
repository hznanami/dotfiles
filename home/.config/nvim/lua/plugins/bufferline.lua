return {
    "akinsho/bufferline.nvim",
    opts = {},
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    lazy = false,
    keys = {
        { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true, desc = "Previous buffer" },
        { "<leader>bl", ":BufferLineCycleNext<CR>", silent = true, desc = "Next buffer" },
        { "<leader>bd", ":bdelete<CR>", silent = true, desc = "Delete buffer" },
        { "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true, desc = "Close other buffers" },
        { "<leader>bb", ":BufferLinePick<CR>", silent = true, desc = "Pick buffer" },
        { "<leader>bc", ":BufferLinePickClose<CR>", silent = true, desc = "Pick and close buffer" },
    },
}
