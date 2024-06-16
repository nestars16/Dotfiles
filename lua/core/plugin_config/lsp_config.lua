--language server setup
local language_servers = {
	"tsserver",
	"clangd",
	"cssls",
	"html",
	"biome",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"tailwindcss",
}

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = language_servers })

local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
		settings = {
			diagnostics = {
				enable = true,
			},
			inlayHints = {
				typeHints = {
					enable = true,
				},
				parameterHints = {
					enable = true,
				},
			},
		},
	})
end

lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enable = true,
			},
			inlayHints = {
				typeHints = {
					enable = true,
				},
				parameterHints = {
					enable = true,
				},
			},
		},
	},
})

--lsp keybindings

--quickfix
vim.keymap.set("n", "<leader>fq", vim.lsp.buf.code_action, {})
--show definition
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
-- rname
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>", vim.diagnostic.goto_next, {})

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

vim.keymap.set("n", "<leader>d", open_diagnostic_float, {})

--snippets and autocomplete
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	sources = cmp.config.sources({
		{
			name = "nvim_lsp",
			entry_filter = function(entry, _)
				local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
				if kind == "Text" then
					return false
				end
        return true
			end,
		},
		{
			name = "luasnip",

			entry_filter = function(entry, _)
				local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]

				if kind == "Text" then
					return false
				end

				return true
			end,
		}, -- For luasnip users.
		{
			name = "nvim_lsp_signature_help",

			entry_filter = function(entry, _)
				local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]

				if kind == "Text" then
					return false
				end

				return true
			end,
		},
	}, {
		{
			name = "buffer",
			entry_filter = function(entry, _)
				local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]

				if kind == "Text" then
					return false
				end

				return true
			end,
		},
	}),
})
