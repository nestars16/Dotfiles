local config = require('nvim-treesitter.configs')

config.setup({
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust","cpp" , "go", "typescript", "html", "css", "javascript"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
 ignore_install = {},
 modules = {},
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,
  highlight = {enable = true},
  indent = { enable = true},
})
