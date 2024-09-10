--return {
--    {
--        "folke/tokyonight.nvim",
--        lazy = false,
--        priority = 1000,
--        config = function()
--            vim.cmd([[colorscheme tokyonight]])
--        end,
--    }
--}


return {
    {
        "luisiacc/gruvbox-baby",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme gruvbox-baby]])
        end,
    }
}
