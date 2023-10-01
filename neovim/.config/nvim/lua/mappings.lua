local Remap = require('keymap')
--Mappings
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

local home = os.getenv("HOME")
local dots = home .. "/dots"
local nvimdots = dots .. "/neovim/.config/nvim"
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

--Edit/Source my config file
-- See :help expand for where I got the '%:h' from
--nnoremap("<leader>ev", ":vsplit $MYVIMRC<CR>:lcd %:h<CR>")
nnoremap("<leader>ev", ":vsplit $MYVIMRC<CR>:lcd " .. nvimdots .. "<CR>")
nnoremap("<leader>sv", ":source $MYVIMRC<CR>")
--Edit dots
nnoremap("<leader>ed", ":vsplit " .. dots .. "<CR>:lcd %<CR>")

--Switching between windows
nnoremap("<leader>h", "<c-w>h")
nnoremap("<leader>j", "<c-w>j")
nnoremap("<leader>k", "<c-w>k")
nnoremap("<leader>l", "<c-w>l")

--Only works with 2 windows, exchanges their place
nnoremap("<leader>x", "<c-w>x")
nnoremap("<leader>o", "<c-w>o")
nnoremap("<leader>w", "<c-w><c-w>")

--evens the split panel size (useful when
--resizing the terminal)
nnoremap("<leader>=", "<c-w>=")

--Reszing windows (alt+ something)
nnoremap("<M-h>", "<C-w><")
nnoremap("<M-j>", "<C-w>+")
nnoremap("<M-k>", "<C-w>-")
nnoremap("<M-l>", "<C-w>>")

--cd to the directory in which the current file is being edited
--nnoremap("<leader>cd", ":lcd %:h<CR>")

--jk to esc insert mode
inoremap("jk", "<esc>")
--jj to skip closing bracket
inoremap("jj", "<esc>la")
--For annoying brackets and quotes I suppose
inoremap("((", "()<esc>i")
inoremap("[[", "[]<esc>i")
inoremap("{{", "{}<esc>i")
inoremap("''", "''<esc>i")
inoremap("\"\"", "\"\"<esc>i")
inoremap("``", "``<esc>i")

--Uppercase in insert mode
inoremap("<C-u>", "<esc>gUiwea")

-- Quickfix tomfoolery

-- no idea what the point of the group is, should probably learn it.
local group = vim.api.nvim_create_augroup("QuickFix", {clear = true})

-- map j to view error from the quicklist, but immediately switch back to the
-- quicklist window.
vim.api.nvim_create_autocmd("FileType",
{ pattern = "qf",
callback = function() vim.keymap.set("n", "j", ":cn<cr><c-w><c-p>", {buffer = true} ) end,
group = group
})

-- map k to previous item in quicklist, switch back to the window.
vim.api.nvim_create_autocmd("FileType",
{ pattern = "qf",
callback = function() vim.keymap.set("n", "k", ":cp<cr><c-w><c-p>", {buffer = true} ) end,
group = group
})

-- map Enter to close the quickfix window, "select" the current item.
vim.api.nvim_create_autocmd("FileType",
{ pattern = "qf",
callback = function() vim.keymap.set("n", "<cr>", ":ccl<cr>", {buffer = true} ) end,
group = group
})
