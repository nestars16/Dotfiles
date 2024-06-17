return {
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/romgrk/barbar.nvim",
	"nvim-tree/nvim-web-devicons",
	"folke/trouble.nvim",
	{
		"hachy/eva01.vim",
		branch = "main",
    config = function()
      vim.cmd [[ colorscheme eva01 ]] -- Set the colorscheme
      vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
    end
	},
	"projekt0n/github-nvim-theme",
	"catppuccin/nvim",
}
