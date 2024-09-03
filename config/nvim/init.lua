require("oskarin_vim")
vim.opt.termguicolors = true
vim.cmd.colorscheme 'gruvbox-baby'
vim.cmd('set nofoldenable')
vim.api.nvim_exec([[
  autocmd BufRead,BufNewFile *.norg set wrap
]], false)
