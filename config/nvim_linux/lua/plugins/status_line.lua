return {
  {
    "echasnovski/mini.nvim",
    enabled = false,
    config = function()
      local statusline = require "mini.statusline"
      statusline.setup {use_icons = true}
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local statusline = require("lualine")
      statusline.setup {
	options = {theme = "gruvbox-baby"}
      }
    end
  }

}

