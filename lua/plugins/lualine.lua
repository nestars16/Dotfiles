return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{
					"filename",

					file_status = true, -- Displays file status (readonly status, modified status)
					newfile_status = false, -- Display new file status (new file means no write after created)
					path = 1, -- 0: Just the filename
					-- 1: Relative path
					-- 2: Absolute path
					-- 3: Absolute path, with tilde as the home directory
					-- 4: Filename and parent dir, with tilde as the home directory

					shorting_target = 40, -- Shortens path to leave 40 spaces in the window
					-- for other components. (terrible name, any suggestions?)
					symbols = {
						modified = "[+]", -- Text to show when the file is modified.
						readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
						unnamed = "[No Name]", -- Text to show for unnamed buffers.
						newfile = "[New]", -- Text to show for newly created file before first write
					},
				},
				window,
			},
			lualine_c = {
				"branch",
				"diff",
				{
					"diagnostics",
					sources = { "nvim_diagnostic", "coc" },
					sections = { "error", "warn", "info", "hint" },

					diagnostics_color = {
						-- Same values as the general color option can be used here.
						error = "DiagnosticError", -- Changes diagnostics' error color.
						warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
						info = "DiagnosticInfo", -- Changes diagnostics' info color.
						hint = "DiagnosticHint", -- Changes diagnostics' hint color.
					},
					symbols = { error = " ", warn = " ", info = " " },
					colored = true, -- Displays diagnostics status in color if set to true.
					update_in_insert = true, -- Update diagnostics in insert mode.
					always_visible = true,
				},
			},
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location", "datetime" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {},
	},
}