-- Leader key
vim.g.mapleader = " "

-- Move for insert mode
vim.keymap.set('i', '<A-h>', '<left>')
vim.keymap.set('i', '<A-j>', '<down>')
vim.keymap.set('i', '<A-k>', '<up>')
vim.keymap.set('i', '<A-l>', '<right>')

-- Terminal
local function create_terminal(buf)
    buf = buf or vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_current_buf(buf)
    vim.fn.termopen(vim.o.shell)
    vim.cmd("startinsert")
end

-- Terminal mode window navigation
-- vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h")
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j")
-- vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k")
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l")
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")

-- Floating terminal
vim.keymap.set("n", "<leader>tt", function()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)
    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })

    create_terminal(buf)
end, {
    desc = "Floating terminal",
})

-- Right terminal
vim.keymap.set("n", "<leader>tr", function()
    vim.cmd("botright vsplit")
    vim.cmd("vertical resize 50")
    create_terminal()
end, {
    desc = "Right terminal",
})

-- Bottom terminal
vim.keymap.set("n", "<leader>tb", function()
    vim.cmd("botright split")
    vim.cmd("resize 9")
    create_terminal()
end, {
    desc = "Bottom terminal",
})
