local Remap = require('keymap')
local nnoremap = Remap.nnoremap
nnoremap("<leader>f",  "<cmd>Telescope find_files<cr>")
nnoremap("<leader>a", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>b",  "<cmd>Telescope buffers<cr>")
nnoremap("<leader>sh", "<cmd>Telescope help_tags<cr>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tt', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>tf', function() builtin.lsp_document_symbols({symbols='function'}) end, {})
vim.keymap.set('n', '<leader>tc', function() builtin.lsp_document_symbols({symbols='class'}) end, {})
vim.keymap.set('n', '<leader>ts', function() builtin.lsp_document_symbols({symbols='struct'}) end, {})
vim.keymap.set('n', '<leader>tv', function() builtin.lsp_document_symbols({symbols='variable'}) end, {})

local actions = require "telescope.actions"

local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I want to search in .gitignore.
table.insert(vimgrep_arguments, "--no-ignore")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

-- or the `.cache` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.cache/*")

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-[>"] = actions.close,
            },
        },
        -- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
    },
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*", "--glob", "!.cache/*", "--no-ignore" },
        }
    },
})

require('telescope').load_extension('fzf')
