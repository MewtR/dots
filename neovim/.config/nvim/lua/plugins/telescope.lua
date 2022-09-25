local Remap = require('keymap')
local nnoremap = Remap.nnoremap
nnoremap("<leader>f",  "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>b",  "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
