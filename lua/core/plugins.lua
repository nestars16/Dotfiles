local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"wbthomason/packer.nvim",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/romgrk/barbar.nvim",
	"nvim-tree/nvim-web-devicons",
	"nvim-tree/nvim-tree.lua",
	"nightsense/carbonized",
	"nvim-lualine/lualine.nvim",
	"folke/trouble.nvim",
	"simrat39/rust-tools.nvim",
	"morhetz/gruvbox",
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-context",
	"hachy/eva01.vim",
	"projekt0n/github-nvim-theme",
	"catppuccin/nvim",
	"mattn/emmet-vim",
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"L3MON4D3/LuaSnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"saadparwaiz1/cmp_luasnip",
	"rafamadriz/friendly-snippets",
	"nvim-telescope/telescope-ui-select.nvim",
	"nvimtools/none-ls.nvim",
}
