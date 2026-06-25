vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1
vim.g.have_nerd_font = true
vim.o.termguicolors = true
vim.o.winblend = 0
vim.opt.updatetime = 250
vim.opt.mouse = "v"                      -- Enable mouse support
vim.opt.hlsearch = true                  -- Highlight search
vim.opt.incsearch = true                 -- Incremental search
vim.opt.tabstop = 2                      -- Number of columns occupied by a tab
vim.opt.softtabstop = 2                  -- See multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true                 -- Converts tabs to white space
vim.opt.shiftwidth = 2                   -- Width for autoindents
vim.opt.autoindent = true                -- Indent a new line the same amount as the line just typed
vim.opt.number = true                    -- Add line numbers
vim.opt.wildmode = { "longest", "list" } -- Get bash-like tab completions
vim.opt.guifont = "Iosevka:h16"          -- Set GUI font
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.inccommand = "split"
vim.opt.hlsearch = true
vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.timeoutlen = 2000

if vim.g.neovide then
	vim.opt.guifont = "Iosevka:h12" -- Set GUI font
	vim.g.neovide_transparency = 0.5
end

local is_wsl = vim.fn.has("wsl") == 1 or vim.env.WSL_DISTRO_NAME ~= nil
local is_ssh = vim.env.SSH_TTY ~= nil or vim.env.SSH_CONNECTION ~= nil

if is_wsl and vim.fn.executable("win32yank.exe") == 1 then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = { "win32yank.exe", "-i", "--crlf" },
			["*"] = { "win32yank.exe", "-i", "--crlf" },
		},
		paste = {
			["+"] = { "win32yank.exe", "-o", "--lf" },
			["*"] = { "win32yank.exe", "-o", "--lf" },
		},
		cache_enabled = 0,
	}
elseif is_ssh then
	local osc52 = require("vim.ui.clipboard.osc52")

	vim.g.clipboard = {
		name = "osc52",
		copy = {
			["+"] = osc52.copy("+"),
			["*"] = osc52.copy("*"),
		},
		paste = {
			["+"] = osc52.paste("+"),
			["*"] = osc52.paste("*"),
		},
	}
end
vim.opt.clipboard = "unnamedplus"
