return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require("telescope").setup{
	pickers = {
	  diagnostics = {
	    theme = "ivy"
	  }
	},
	extensions = {
	  fzf = {}
	}
      }
      require("telescope").load_extension("fzf")
      vim.keymap.set("n", "<leader>pf", require('telescope.builtin').find_files)
      vim.keymap.set("n", "<leader>pd", require('telescope.builtin').diagnostics)
      vim.keymap.set("n", "<leader>ph", require('telescope.builtin').help_tags)
      vim.keymap.set("n", "<leader>en", function()
	require('telescope.builtin').find_files {
	  cwd = vim.fn.stdpath("config")
	}
      end,
      require("config.multigrep").setup()
    )
    end
  }
}
