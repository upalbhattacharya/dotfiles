-- Themes

-- local dracula = require("dracula")
local lualine = require("lualine")
local alpha = require("alpha")
local startify = require("alpha.themes.startify")
local colorizer = require("colorizer")

vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])

-- Make NvimTree transparent in tmux
vim.cmd([[ hi NvimTreeNormal guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi NormalNC guibg=NONE ctermbg=NONE ]])
-- Lualine
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin-mocha",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

-- Alpha Startify

startify.section.header.val = {
	[[    ___      ___      ___      ___  ___           ___     ___      ___      ___    ]],
	[[   /\__\    /\  \    /\  \    /\__\/\  \         /\__\   /\__\    /\  \    /\__\   ]],
	[[  /:/ _/_  /::\  \  /::\  \  /:/  /::\  \       /:| _|_ /:/ _/_  _\:\  \  /::L_L_  ]],
	[[ /:/_/\__\/::\:\__\/::\:\__\/:/__/\:\:\__\     /::|/\__\::L/\__\/\/::\__\/:/L:\__\ ]],
	[[ \:\/:/  /\/\::/  /\/\::/  /\:\  \:\:\/__/     \/|::/  /::::/  /\::/\/__/\/_/:/  / ]],
	[[  \::/  /    \/__/   /:/  /  \:\__\::/  /        |:/  / L;;/__/  \:\__\    /:/  /  ]],
	[[   \/__/             \/__/    \/__/\/__/         \/__/            \/__/    \/__/   ]],
}
alpha.setup(startify.opts)

-- Colorizer
colorizer.setup()

-- tabby.nvim

local theme = {
	fill = { fg = "#CAD3F5", bg = "#181926" },
	head = { fg = "#181926", bg = "#F5BDE6" },
	current_tab = { fg = "#181926", bg = "#A6DA95" },
	tab = { fg = "#181926", bg = "#363A4F" },
	current_win = { fg = "#181926", bg = "#EED49F" },
	win = { fg = "#181926", bg = "#A6DA95" },
	tail = { fg = "#181926", bg = "#F5A97F" },
}
require("tabby.tabline").set(function(line)
	return {
		{
			{ "  ", hl = theme.head },
			line.sep("", theme.head, theme.fill),
		},
		line.tabs().foreach(function(tab)
			local hl = tab.is_current() and theme.current_tab or theme.tab
			return {
				line.sep("", theme.fill, hl),
				tab.number(),
				tab.name(),
				-- tab.close_btn(''),
				line.sep("", hl, theme.fill),
				hl = hl,
				margin = " ",
			}
		end),
		line.spacer(),
		line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
			local hl = win.is_current() and theme.current_win or theme.tab
			return {
				line.sep("", hl, theme.fill),
				win.buf_name(),
				line.sep("", theme.fill, hl),
				hl = hl,
				margin = " ",
			}
		end),
		{
			line.sep("", theme.tail, theme.fill),
			{ "  ", hl = theme.tail },
		},
		hl = theme.fill,
	}
end)

