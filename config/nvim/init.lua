require("oskarin_vim")
vim.opt.termguicolors = true
vim.cmd.colorscheme 'melange'
vim.cmd('set nofoldenable')
vim.api.nvim_exec([[
  autocmd BufRead,BufNewFile *.norg set wrap
]], false)
