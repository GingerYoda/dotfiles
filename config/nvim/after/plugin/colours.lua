function ColourKitty(colour)
    colour = colour or "darkrose"
    require("darkrose").setup({
        -- Override colors
        colors = {
            orange = "#F87757",
        },
        -- Override existing or add new highlight groups
        overrides = function(c)
            return {
                Class = { fg = c.magenta },
                ["@variable"] = { fg = c.fg_dark },
            }
        end
    })
    vim.cmd.colorscheme(colour)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColourKitty()
