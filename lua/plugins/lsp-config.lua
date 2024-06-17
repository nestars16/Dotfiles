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

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({ ensure_installed = language_servers })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities =
          require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

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

      vim.keymap.set("n", "<leader>fq", vim.lsp.buf.code_action, {})
      --show definition
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      --go to definition
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      -- rname
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>", vim.diagnostic.goto_next, {})

      vim.diagnostic.config({
        signs = true,         -- Keep the signs in the gutter
        underline = true,     -- Keep the underline for errors
        update_in_insert = false, -- Update diagnostics only when leaving insert mode
        severity_sort = true, -- Sort diagnostics by severity
        float = {
          source = "always",  -- Show source in diagnostics float window
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
    end,
  },
}
