-- Basic

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.syntax = "enable"
vim.opt.autoread = true
vim.api.nvim_command("filetype plugin indent on")
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.hidden = true
vim.opt.fileformat = "unix"
vim.opt.completeopt = "preview,menu,menuone,noselect"
vim.opt.textwidth = 80
vim.opt.formatoptions = tcqj

-- Visual

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "80"
vim.cmd([[highlight ColorColumn ctermbg=0 guibg=lightgrey]])
vim.opt.showtabline = 2 -- Always
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true

-- Behaviour

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 100
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.smartindent = true
vim.opt.undolevels = 1000
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.minimap_width = 10
vim.g.minimap_auto_start = 1
vim.g.minimap_auto_start_win_enter = 1

