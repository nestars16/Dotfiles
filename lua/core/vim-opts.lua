vim.api.nvim_set_option("clipboard","unnamed")
vim.opt.mouse = 'v' -- Enable mouse support
vim.opt.hlsearch = true -- Highlight search
vim.opt.incsearch = true -- Incremental search
vim.opt.tabstop = 2 -- Number of columns occupied by a tab
vim.opt.softtabstop = 2 -- See multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true -- Converts tabs to white space
vim.opt.shiftwidth = 2 -- Width for autoindents
vim.opt.autoindent = true -- Indent a new line the same amount as the line just typed
vim.g.loaded_netrw = 1
vim.g.loaded_netrwplugin = 1
vim.opt.number = true -- Add line numbers
vim.opt.wildmode = {'longest', 'list'} -- Get bash-like tab completions
vim.opt.guifont = 'Iosevka:h16' -- Set GUI font
vim.o.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
