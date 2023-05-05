-- Basic

vim.opt.encoding		    = "utf-8"
vim.opt.fileencoding		= "utf-8"
vim.opt.syntax			    = "enable"
vim.opt.autoread		    = true
vim.api.nvim_command('filetype plugin indent on')
vim.opt.backup				= false
vim.opt.writebackup			= false
vim.opt.swapfile			= false
vim.opt.hidden				= true
vim.opt.hidden				= true
vim.opt.fileformat			= "unix"
vim.opt.completeopt			= "preview,menu,menuone,noselect"
vim.opt.textwidth           = 80
vim.opt.formatoptions       = tcqj

-- Visual

vim.opt.number				= true
vim.opt.cursorline			= true
vim.opt.cursorcolumn		= true
vim.opt.colorcolumn = '80'
vim.cmd([[highlight ColorColumn ctermbg=0 guibg=lightgrey]])
vim.opt.showtabline			= 2 		-- Always
vim.opt.splitright          = true
vim.opt.splitbelow          = true
vim.opt.termguicolors       = true

-- Behaviour

vim.opt.ignorecase			= true
vim.opt.smartcase			= true
vim.opt.timeout				= true
vim.opt.timeoutlen			= 1000
vim.opt.updatetime			= 100
vim.opt.clipboard			= 'unnamedplus'
vim.opt.tabstop				= 4
vim.opt.softtabstop			= 4
vim.opt.shiftwidth			= 4
vim.opt.expandtab			= true
vim.opt.smarttab			= true
vim.opt.autoindent			= true
vim.opt.showmatch			= true
vim.opt.hlsearch			= true
vim.opt.smartindent         = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
