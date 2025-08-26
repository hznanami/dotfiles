return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    -- lazy = true,
    opts = {},
    keys = {
        { "<leader>ff", ":FzfLua files<CR>", silent = true },
        { "<leader>fb", ":FzfLua buffers<CR>", silent = true },
        { "<leader>fc", ":FzfLua colorschemes<CR>", silent = true },
    },
}
