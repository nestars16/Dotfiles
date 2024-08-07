return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")

			config.setup({
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"rust",
					"cpp",
					"go",
					"typescript",
					"html",
					"css",
					"javascript",
					"gdscript",
					"python",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,
				ignore_install = {},
				modules = {},
				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<leader>s",
						node_incremental = "<leader>sni",
						scope_incremental = "<leader>ssi",
						node_decremental = "<M-space>sd", -- Alt+space, might have to disable the Ubuntu hot key for this
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
			max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
			min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
			line_numbers = true,
			multiline_threshold = 5, -- Maximum number of lines to collapse for a single context line
			trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
			mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
			-- Separator between context and content. Should be a single character string, like '-'.
			-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
			separator = nil,
			on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
		},
	},
}
