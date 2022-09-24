
return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use {
    'nvim-lualine/lualine.nvim',
    config = function() require 'statusline/evil_lualine' end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

end)
