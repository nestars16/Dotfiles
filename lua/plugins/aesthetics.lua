-- 	vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
return {
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/romgrk/barbar.nvim",
	"nvim-tree/nvim-web-devicons",
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	"folke/trouble.nvim",
	{
		"hachy/eva01.vim",
		branch = "main",
		-- config = function()
		-- 	vim.cmd([[ colorscheme eva01 ]]) -- Set the colorscheme
		-- end,
	},
	"projekt0n/github-nvim-theme",
	"catppuccin/nvim",
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
			vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
		end,
	},
}
