return {
  "neovim/nvim-lspconfig",
  dependencies = {
    'saghen/blink.cmp',
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
	library = {
	  -- See the configuration section for more details
	  -- Load luvit types when the `vim.uv` word is found
	  { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
      },
    },
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("lspconfig").lua_ls.setup ({
      capabilities = capabilities
    })
    require("lspconfig").gopls.setup ({
      capabilities = capabilities
    })
    require("lspconfig").clangd.setup({
      capabilities = capabilities
    })
    vim.lsp.inlay_hint.enable(false)
    vim.diagnostic.enable(false)
    vim.diagnostic.config({
      virtual_text = false,
      underline = false,
      --signs = false,
    })
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local opts = { buffer = 0 }
        local telescope = require("telescope.builtin")
        vim.keymap.set("n", "gd", function() telescope.lsp_definitions() end, opts)
        vim.keymap.set("n", "gi", function() telescope.lsp_implementations() end, opts)
        vim.keymap.set("n", "<leader>grr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>gws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>gca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>grn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>gcs", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
        vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set('n', 'gK', function()
          local new_config = not vim.diagnostic.config().virtual_lines
          vim.diagnostic.config({ virtual_lines = new_config })
        end, { desc = 'Toggle diagnostic virtual_lines' })
      end
    })
  end,
}
