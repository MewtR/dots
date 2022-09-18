local Remap = require('keymap')
--Mappings
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

--Edit/Source my config file
nnoremap("<leader>ev", ":vsplit $MYVIMRC<CR>")
nnoremap("<leader>sv", ":source $MYVIMRC<CR>")

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
