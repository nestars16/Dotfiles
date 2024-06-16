vim.api.nvim_set_keymap('n', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Space>', '<Nop>', { noremap = true, silent = true })

vim.g.mapleader = " "
-- Disable arrow keys in normal and insert modes
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', { noremap = true, silent = true })

-- Window navigation with Ctrl + arrow keys
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-W>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-W>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-n>', '<C-W>v', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-c>', ':only<CR>', { noremap = true, silent = true })

-- Delete word backwards in insert mode


-- Exit terminal mode with Esc
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<C-j>',':bp<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<C-k>',':bn<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n','<C-w>',':bd<CR>', { noremap = true, silent = true})

