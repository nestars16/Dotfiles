return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
    local null_ls = require("null-ls")
		local ast_grep_formatter = {
			method = null_ls.methods.FORMATTING,

			filetypes = {
				"c",
				"cpp",
				"rust",
				"go",
				"java",
				"python",
				"cs",
				"javascript",
				"javascriptreact",
				"typescript",
				"html",
				"css",
				"kotlin",
				"dart",
				"lua",
			},
			generator = null_ls.generator({
				command = "ast_grep",
				args = { "format" },
				to_stdin = true,
			}),
		}

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				ast_grep_formatter,
			},
		})

		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
	end,
}
