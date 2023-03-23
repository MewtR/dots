
return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use {
        'nvim-lualine/lualine.nvim',
        config = function() require 'plugins/evil_lualine' end,
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Colorschemes section
    use ("folke/tokyonight.nvim")

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- fzf native
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    -- vimwiki
    use("vimwiki/vimwiki")

    -- kotlin
    use 'udalov/kotlin-vim'

    -- vim sandwich
    use {
        'machakann/vim-sandwich',
        config = 'vim.cmd "let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)"'
    }

    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

end)
