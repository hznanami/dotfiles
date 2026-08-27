return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "User IceLoad",
    opts = {
        options = {
            theme = require("gruvbox-material.lualine").theme("medium"),
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
        },
        sections = {
            lualine_b = { "branch", "diff" },
            lualine_x = {
                "filetype",
                "encoding",
            },
        },
    },
}

