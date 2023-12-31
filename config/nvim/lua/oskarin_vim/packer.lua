-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({'water-sucks/darkrose.nvim',
    as = 'darkrose',})
--    use({
--        'rebelot/kanagawa.nvim',
--        as = 'kanagawa',
--        config = function()
--            vim.cmd('colorscheme kanagawa')
--        end
--    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('prettier/vim-prettier', { run = 'yarn install --frozen-lockfile --production' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use("mbbill/undotree")
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use {
        "windwp/nvim-autopairs",
         config = function() require("nvim-autopairs").setup {} end
    }
end)
