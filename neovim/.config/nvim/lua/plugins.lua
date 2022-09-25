
return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use {
    'nvim-lualine/lualine.nvim',
    config = function() require 'plugins/evil_lualine' end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Colorschemes section
    use ("folke/tokyonight.nvim")
end)
