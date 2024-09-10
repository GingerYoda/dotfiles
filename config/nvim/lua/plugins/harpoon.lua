return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
                local harpoon = require("harpoon")

            harpoon:setup()

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<C-7>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<C-8>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<C-9>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<C-0>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<leader><C-7>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader><C-8>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader><C-9>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader><C-0>", function() harpoon:list():replace_at(4) end)
        end
    }
}

