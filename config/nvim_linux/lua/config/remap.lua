vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader><leader>x", ":source%<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({"n"}, "<leader>pp", [["+p]])
vim.keymap.set("n", "<leader>mm", function()
  vim.api.nvim_command("wall")
  vim.cmd.make()
end)


vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0,10)
end)

vim.keymap.set("i", "<C-c>", "<Esc>")

local function make_with_args()
 vim.ui.input({ prompt = 'Make args: ' }, function(input)
  if input and input ~= "" then
   vim.cmd.make(input)
  end
 end)
end

vim.keymap.set("n", "<space>ma", make_with_args)



