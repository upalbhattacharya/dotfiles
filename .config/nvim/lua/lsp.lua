require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
local trouble = require("trouble")
local cmp = require("cmp")
local null_ls = require("null-ls")
local neogen = require("neogen")

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		-- { name = 'vsnip' }, -- For vsnip users.
		{ name = "luasnip" }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

-- lspconfigs
vim.diagnostic.config({ virtual_text = false }) -- disable in-line errors
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.pylsp.setup({
	capabilities = capabilities,
})
lspconfig.yamlls.setup({
	capabilities = capabilities,
})
lspconfig.lua_ls.setup({
	capabilities = capabilities,
})
lspconfig.jsonls.setup({
	capabilities = capabilities,
})
lspconfig.bashls.setup({
	capabilities = capabilities,
})
lspconfig.marksman.setup({
	capabilities = capabilities,
})
lspconfig.yamlls.setup({
	capabilities = capabilities,
})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black.with({
			extra_args = { "--line-length", "79" },
		}),
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.markdownlint.with({
            extra_args = { "--line-length", "79" },
        }),
        null_ls.builtins.diagnostics.yamllint
	},
})

neogen.setup({
	languages = {
		python = {
			template = {
				annotation_convention = "numpydoc",
				position = "after",
			},
		},
	},
})

trouble.setup({
	mode = "document_diagnostics",
})
