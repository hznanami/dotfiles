return {
    "lukas-reineke/indent-blankline.nvim",
    event = "User IceLoad",
    main = "ibl",
    opts = {
        exclude = {
            filetypes = { "dashboard", "terminal", "help", "log", "markdown", "TelescopePrompt" },
        },
    },
}
