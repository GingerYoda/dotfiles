return {
    "mfussenegger/nvim-dap",
    config = function()
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
    end
  }
