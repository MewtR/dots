local Remap = require('keymap')
local nnoremap = Remap.nnoremap
nnoremap("<leader>f",  "<cmd>Telescope find_files<cr>")
nnoremap("<leader>a", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>b",  "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

local actions = require "telescope.actions"

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-[>"] = actions.close,
            },
        },
    },
}) 

require('telescope').load_extension('fzf')
