local language_servers = {
	"tsserver",
	"clangd",
	"cssls",
	"html",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"tailwindcss",
}

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",

		lazy = false,
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({ ensure_installed = language_servers })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"nvim-telescope/telescope.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},

		config = function()
			local lspconfig = require("lspconfig")

			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local builtin = require("telescope.builtin")
			capabilities.textDocument.inlayHint = {
				dynamicRegistration = true,
				inlayHints = {
					parameterNames = true,
					typeHints = true,
				},
			}

			for _, lsp in ipairs(language_servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

			vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
			vim.keymap.set("n", "gr", builtin.lsp_references, {})
			vim.keymap.set("n", "gI", builtin.lsp_implementations, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			-- rename
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

			vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "<leader>gN", vim.diagnostic.goto_prev, {})

			vim.keymap.set("n", "<leader>sf", builtin.lsp_document_symbols, {})
			vim.keymap.set("n", "<leader>sw", builtin.lsp_dynamic_workspace_symbols, {})

			vim.diagnostic.config({
				signs = true, -- Keep the signs in the gutter
				underline = true, -- Keep the underline for errors
				update_in_insert = false, -- Update diagnostics only when leaving insert mode
				severity_sort = true, -- Sort diagnostics by severity
				float = {
					source = "always", -- Show source in diagnostics float window
				},
			})

			local function open_diagnostic_float()
				local opts = {
					focusable = false,
					close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
					border = "rounded",
					source = "always", -- Show source in diagnostics float window
					prefix = " ",
				}
				vim.diagnostic.open_float(nil, opts)
			end

			vim.keymap.set("n", "<leader>ds", open_diagnostic_float, {})

			local gdscript_config = {
				capabilities = capabilities,
				settings = {},
			}

			if vim.fn.has("win32") == 1 then
				-- Windows specific. Requires nmap installed (`winget install nmap`)
				gdscript_config["cmd"] = { "ncat", "localhost", os.getenv("GDScript_Port") or "6005" }
			end

			require("lspconfig").gdscript.setup(gdscript_config)
		end,
	},
}
