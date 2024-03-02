--Global settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.path = vim.opt.path + "**"
vim.opt.virtualedit = "onemore"
vim.opt.completeopt = vim.opt.completeopt - "preview"
vim.opt.shortmess = vim.opt.shortmess + "c"
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 2
vim.opt.scrolloff = 5
vim.opt.smartcase = true

-- Cursor options
cursors = {
    ["horizontal"] = "a:hor50-blinkwait700-blinkoff400-blinkon250", -- underline cursor
    ["block"] = "a:block-blinkwait700-blinkoff400-blinkon250",
    ["beam"] = "a:ver10-blinkwait700-blinkoff400-blinkon250",
}

vim.api.nvim_create_autocmd(
{"VimLeave"},
{ callback = function() 
    -- vim.opt.guicursor = cursors["beam"] -- comment out the return for petalchaser
    return
end })

-- Save cursor position
vim.api.nvim_create_autocmd(
{"BufReadPost"},
{ callback = function() 
    vim.fn.setpos(".", vim.fn.getpos("'\""))
end })

