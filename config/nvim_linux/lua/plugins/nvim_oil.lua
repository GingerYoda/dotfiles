return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
    vim.keymap.set("n", "<leader>pv", ":Oil<CR>"),
    config = function()
      require("oil").setup({
        columns = {
          "icon",
          "size",
        },
        view_options = {
          show_hidden = true,
        },
      })
    end
  }
}
