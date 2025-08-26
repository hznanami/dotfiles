return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            theme = 'doom',
            -- preview = {
            --     -- command = "cat",
            --     -- file_path = "~/.config/nvim/lua/plugins/dashboard-header.txt",
            --     -- file_width = 100,
            --     -- file_height = 36,
            -- },
            config = {
                header = {
                    "",
                    "",
                    "",
                    " ███╗   ██╗███████╗ ██████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
                    " ████╗  ██║██╔════╝██╔═══██╗████╗  ██║██║   ██║██║████╗ ████║",
                    " ██╔██╗ ██║█████╗  ██║   ██║██╔██╗ ██║██║   ██║██║██╔████╔██║",
                    " ██║╚██╗██║██╔══╝  ██║   ██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
                    " ██║ ╚████║███████╗╚██████╔╝██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
                    " ╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
                    "",
                    "",
                    "",
                },
                center = {
                    {
                        icon = "  ",
                        desc = "New file",
                        action = "ene | startinsert",
                        key = 'e',
                    },
                    {
                        icon = "󰍉  ",
                        desc = "Find file",
                        action = "lua require('fzf-lua').files()",
                        key = 'f',
                    },
                    {
                        icon = "  ",
                        desc = "File Browser",
                        action = "Yazi",
                        key = 'b',
                    },
                    {
                        icon = "  ",
                        desc = "Lazy Profile",
                        action = "Lazy profile",
                        key = 'p',
                    },
                    {
                        icon = "󰅙  ",
                        desc = "Quit",
                        action = "q!",
                        key = 'q',
                    },
                },
                footer = {},
            },
            -- config
        }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
