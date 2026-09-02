return {
    "f4z3r/gruvbox-material.nvim",
    name = "gruvbox-material",
    lazy = false,
    priority = 1000,
    opts = {
        contrast = "medium",
    },
    config = function(_, opts)
        require("gruvbox-material").setup(opts)
        vim.cmd.colorscheme("gruvbox-material")
    end,
}
