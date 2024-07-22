return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		{
			"nvim-telescope/telescope-ui-select.nvim",
			dependencies = { "nvim-telescope/telescope.nvim" },
		},
	},
	config = function()
		local width = 40
		local height = 20

		require("nvim-tree").setup({
			disable_netrw = true,
			hijack_netrw = false,
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			view = {
				side = "right",
				float = {
					enable = true,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						width = width,
						height = height,
						col = vim.o.columns - width,
						border = "rounded",
					},
				},
			},
			reload_on_bufenter = true,
			select_prompts = true,
			notify = {
				absolute_path = true,
			},
			diagnostics = {
				enable = true,
				severity = {
					min = vim.diagnostic.severity.ERROR,
				},
				icons = {
					error = "",
				},
			},
			renderer = {
				highlight_git = true,
				highlight_opened_files = "all",
				add_trailing = true,
				highlight_diagnostics = true,
			},
		})

		vim.api.nvim_set_keymap(
			"n",
			"<C- >",
			":NvimTreeToggle <bar> NvimTreeFocus<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
