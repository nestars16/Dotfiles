return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
		}

		vim.keymap.set("n", "<leader>DC", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<leader>BT", function()
			dap.toggle_breakpoint()
		end)
		vim.keymap.set("n", "<leader>BS", function()
			dap.set_breakpoint()
		end)
	end,
}
