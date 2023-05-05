-- Themes

local dracula = require("dracula")
local lualine = require("lualine")
local alpha = require("alpha")
local startify = require("alpha.themes.startify")
local colorizer = require("colorizer")

-- Dracula
-- Customized for transparent background
dracula.setup({
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = true, -- default false
})

vim.cmd [[colorscheme dracula]]

-- Lualine
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'dracula-nvim',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- Alpha Startify

startify.section.header.val = {
[[    ___      ___      ___      ___  ___           ___     ___      ___      ___    ]],
[[   /\__\    /\  \    /\  \    /\__\/\  \         /\__\   /\__\    /\  \    /\__\   ]],
[[  /:/ _/_  /::\  \  /::\  \  /:/  /::\  \       /:| _|_ /:/ _/_  _\:\  \  /::L_L_  ]],
[[ /:/_/\__\/::\:\__\/::\:\__\/:/__/\:\:\__\     /::|/\__\::L/\__\/\/::\__\/:/L:\__\ ]],
[[ \:\/:/  /\/\::/  /\/\::/  /\:\  \:\:\/__/     \/|::/  /::::/  /\::/\/__/\/_/:/  / ]],
[[  \::/  /    \/__/   /:/  /  \:\__\::/  /        |:/  / L;;/__/  \:\__\    /:/  /  ]],
[[   \/__/             \/__/    \/__/\/__/         \/__/            \/__/    \/__/   ]]
}
alpha.setup(startify.opts)

-- Colorizer
colorizer.setup()
