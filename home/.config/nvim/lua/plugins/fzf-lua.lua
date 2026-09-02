return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    -- lazy = true,
    opts = {},
    keys = {
        { "<leader>ff", ":FzfLua files<CR>", silent = true, desc = "Find files" },
        { "<leader>fb", ":FzfLua buffers<CR>", silent = true, desc = "Find buffers" },
        { "<leader>fc", ":FzfLua colorschemes<CR>", silent = true, desc = "Find colorschemes" },
    },
}
