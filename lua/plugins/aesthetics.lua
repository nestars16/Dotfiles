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
	},
	{
		"xero/miasma.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme miasma")

			-- Make the text background transparent for main editing and additional elements
			vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight LineNr guibg=none
  highlight CursorLineNr guibg=none
  highlight Folded guibg=none
  highlight EndOfBuffer guibg=none
  highlight SignColumn guibg=none
  highlight VertSplit guibg=none
  highlight StatusLine guibg=none
  highlight StatusLineNC guibg=none
  highlight TabLine guibg=none
  highlight TabLineFill guibg=none
  highlight TabLineSel guibg=none
  highlight Pmenu guibg=none
  highlight PmenuSel guibg=none
  highlight CursorLine guibg=none
  highlight Visual guibg=none
]])

			-- Make floating windows, popups, and borders transparent
			vim.cmd([[
  highlight NormalFloat guibg=none
  highlight FloatBorder guibg=none
]])

			-- Transparency for Telescope elements, if using Telescope
			vim.cmd([[
  highlight TelescopeNormal guibg=none
  highlight TelescopeBorder guibg=none
  highlight TelescopePromptBorder guibg=none
  highlight TelescopeResultsBorder guibg=none
  highlight TelescopePreviewBorder guibg=none
]])

			-- Set transparency for text selections and virtual text
			vim.cmd([[
  highlight Visual guibg=none
  highlight CursorLine guibg=none
  highlight CursorLineNr guibg=none
  highlight VisualNC guibg=none
  highlight LspDiagnosticsVirtualTextError guibg=none
  highlight LspDiagnosticsVirtualTextWarning guibg=none
  highlight LspDiagnosticsVirtualTextInformation guibg=none
  highlight LspDiagnosticsVirtualTextHint guibg=none
]])
		end,
	},
}
