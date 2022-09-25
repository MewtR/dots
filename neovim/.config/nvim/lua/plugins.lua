
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
    use{
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
end)
