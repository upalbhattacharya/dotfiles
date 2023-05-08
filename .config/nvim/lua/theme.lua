-- Themes

-- local dracula = require("dracula")
local lualine = require("lualine")
local alpha = require("alpha")
local startify = require("alpha.themes.startify")
local colorizer = require("colorizer")

-- Dracula
-- Customized for transparent background
-- dracula.setup({
--   -- show the '~' characters after the end of buffers
--   show_end_of_buffer = true, -- default false
--   -- use transparent background
--   transparent_bg = true, -- default false
-- })
--
vim.cmd([[colorscheme nordfox]])
vim.cmd([[ hi Normal guibg=NONE ctermbg=NONE ]])

-- Make NvimTree transparent in tmux
vim.cmd([[ hi NvimTreeNormal guibg=NONE ctermbg=NONE ]])
vim.cmd([[ hi NormalNC guibg=NONE ctermbg=NONE ]])
-- Lualine
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "nordfox",
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
	-- fill = 'TabLineFill',
	fill = { fg = "#D8DEE9", bg = "#3B4252" },
	-- head = 'TabLine',
	head = { fg = "#2E3440", bg = "#B48EAD" },
	-- current_tab = 'TabLineSel',
	current_tab = { fg = "#2E3440", bg = "#A3BE8C" },
	-- tab = 'TabLine',
	tab = { fg = "#D8DEE9", bg = "#4C566A" },
	-- win = 'TabLine',
	win = { fg = "#2E3440", bg = "#A3BE8C" },
	-- tail = 'TabLine',
	tail = { fg = "#2E3440", bg = "#B48EAD" },
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
				tab.is_current() and "" or "",
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
			return {
				line.sep("", theme.fill, theme.win),
				win.is_current() and "" or "",
				win.buf_name() .. " ",
				hl = theme.win,
				margin = " ",
			}
		end),
	}
end)
