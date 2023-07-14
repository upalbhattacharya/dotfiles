require("aerial").setup({
	backends = { "treesitter", "lsp", "markdown", "man" },
	layout = {
		min_width = 30,
		win_opts = {},
		default_direction = "prefer_right",
		placement = "edge",
		resize_to_content = true,
		preserve_equality = false,
	},
	filter_kind = false,
	manage_folds = true,
	link_folds_to_tree = true,
	link_tree_to_folds = true,
	attach_mode = "global",
	open_automatic = true,
	highlight_on_hover = true,
	show_guides = true,
	autojump = true,
})
require("nvim-treesitter.configs").setup({
	-- One of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = "python",
	"c++",
	"markdown",
	"lua",
	"vim",
	"javascript",
	"yaml",

	-- Install languages synchronously (only applied to `ensure_installed`)
	sync_install = true,

	-- List of parsers to ignore installing

	highlight = {
		-- `false` will disable the whole extension
		enable = true,
	},
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

require("nvim_comment").setup()

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup({
	show_end_of_line = true,
})
require("nvim-tree").setup()
require("leap").add_default_mappings()
require("diffview").setup()
require("telescope").setup()
