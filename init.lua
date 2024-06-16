vim.api.nvim_set_option("clipboard","unnamed")
-- Enable mouse support
vim.opt.mouse = 'v' -- Enable mouse support


-- Search settings
vim.opt.hlsearch = true -- Highlight search
vim.opt.incsearch = true -- Incremental search

-- Tab and indentation settings
vim.opt.tabstop = 2 -- Number of columns occupied by a tab
vim.opt.softtabstop = 2 -- See multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true -- Converts tabs to white space
vim.opt.shiftwidth = 2 -- Width for autoindents
vim.opt.autoindent = true -- Indent a new line the same amount as the line just typed


-- Line numbers
vim.opt.number = true -- Add line numbers

-- Command line completion mode
vim.opt.wildmode = {'longest', 'list'} -- Get bash-like tab completions

-- GUI font
vim.opt.guifont = 'Iosevka:h16' -- Set GUI font

require("core.keymaps")
require("core.plugins")
require("core.plugin_config")
