
vim.opt.background = "dark";

--Global settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = 4
vim.opt.ignorecase = true
vim.opt.relativenumber = true
vim.opt.number = true
--vim.opt.path+="**"
vim.opt.virtualedit = "onemore"
--vim.opt.completeopt-= "preview"

-- Cursor option
vim.api.nvim_create_autocmd(
{"VimLeave"},
{ command = vim.opt.guicursor="a:hor50-blinkwait700-blinkoff400-blinkon250" })
