local dap = require("dap")

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

vim.keymap.set("n", "<F5>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader><F12>", ":lua require'dap'.terminate()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>")

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = true,
  },
}


dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = true,
  },
}

require("dapui").setup()

local dapui = require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.api.nvim_create_user_command("RunScriptWithArgs", function(t)
	-- :help nvim_create_user_command
	local args = vim.split(vim.fn.expand(t.args), '\n')
	local approval = vim.fn.confirm(
		"Will try to run:\n    " ..
		vim.bo.filetype .. " " ..
		vim.fn.expand('%') .. " " ..
		t.args .. "\n\n" ..
		"Do you approve? ",
		"&Yes\n&No", 1
	)
	if approval == 1 then
		dap.run({
			type = vim.bo.filetype,
			request = 'launch',
			name = 'Launch file with custom arguments (adhoc)',
			program = '${file}',
			args = args,
		})
	end
end, {
	complete = 'file',
	nargs = '*'
})
vim.keymap.set('n', '<F4>', ":RunScriptWithArgs ")
