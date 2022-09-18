local Remap = require(keymap)
--Mappings
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>ev", ":vsplit $MYVIMRC<CR>")
nnoremap("<leader>sv", ":source $MYVIMRC<CR>")
