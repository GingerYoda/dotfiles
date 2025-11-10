vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = {"make"},
  callback = function()
    vim.cmd("copen")
    vim.cmd("wincmd L")
  end,
})
