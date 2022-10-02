
return require("packer").startup(function()
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

    -- lsp
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client

    -- kotlin
    use 'udalov/kotlin-vim'
end)
