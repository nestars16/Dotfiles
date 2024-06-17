return {
  "nvim-telescope/telescope-ui-select.nvim",
  dependencies = {"nvim-telescope/telescope.nvim"},
  config = function()
    local telescope = require('telescope')

    telescope.setup {
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
		  telescope.load_extension("ui-select")
			},
		},
		pickers = {
			live_grep = {
				cwd = vim.loop.cwd(),
			},
		},
    }
		telescope.load_extension("ui-select")
  end
}
