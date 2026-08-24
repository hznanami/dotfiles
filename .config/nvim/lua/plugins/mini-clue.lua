return {
    "nvim-mini/mini.clue",
    version = "*",
    event = "VeryLazy",
    opts = {
        window = {
            delay = 1000
        },
        triggers = {
            { mode = { "n", "x" }, keys = "<Leader>" },
        },
        clues = {
            {
                mode = "n",
                keys = "<Leader>b",
                desc = "Buffer",
            },
            {
                mode = "n",
                keys = "<Leader>f",
                desc = "Find",
            },
            {
                mode = "n",
                keys = "<Leader>e",
                desc = "TFM Open",
            },
        },
    },
}
