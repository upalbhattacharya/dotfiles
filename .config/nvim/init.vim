" 
" 

call plug#begin('~/.config/nvim/plugged')

" Appearence
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'mhinz/vim-startify'
Plug 'norcalli/nvim-colorizer.lua'


" Diagnostics
Plug 'folke/trouble.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'


" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'simrat39/symbols-outline.nvim'

" Formatting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'brentyi/isort.vim'
Plug 'preservim/nerdcommenter'
Plug 'lukas-reineke/indent-blankline.nvim'


" QOL Improvements
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'vimwiki/vimwiki'
Plug 'skywind3000/asyncrun.vim'
Plug 'easymotion/vim-easymotion'
Plug 'liuchengxu/vim-which-key'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'wfxr/minimap.vim'
Plug 'ActivityWatch/aw-watcher-vim'

call plug#end()

"===============================================================================
"								GENERAL OPTIONS
"===============================================================================

" Setting leader and localleader
let mapleader = ","
let maplocalleader = "\\"

" Defining the reading file format
set fileformat=unix

" Defining file encoding
set encoding=utf-8

" Enable syntax highlighting
syntax on

" Setting filetype detection, plugin and indent
filetype plugin indent on

" Autoreading files that were saved outside neovim
set autoread

" Deleting any backup files created prior to saving
set nobackup

" Deleting backups created during a write event
set nowritebackup

" Disabling swap
set noswapfile

" Preventing throwing away of buffers
set hidden

" Copy to clipboard
set clipboard+=unnamedplus

" Open splits on the right and below
set splitbelow
set splitright

" Setting the opened file's directory to the current working directory
autocmd BufEnter * silent! lcd %:p:h

" Defining default python environment
let g:python3_host_prog = expand('/home/workboots/VirtualEnvs/aiml/bin/python3')

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

set completeopt=preview,menu,menuone,noselect

"===============================================================================
"							UI AND APPEARENCE
"===============================================================================
"
" Startify Header
let g:startify_custom_header = [
\'    ___      ___      ___      ___  ___           ___     ___      ___      ___    ',
\'   /\__\    /\  \    /\  \    /\__\/\  \         /\__\   /\__\    /\  \    /\__\   ',
\'  /:/ _/_  /::\  \  /::\  \  /:/  /::\  \       /:| _|_ /:/ _/_  _\:\  \  /::L_L_  ',
\' /:/_/\__\/::\:\__\/::\:\__\/:/__/\:\:\__\     /::|/\__\::L/\__\/\/::\__\/:/L:\__\ ',
\' \:\/:/  /\/\::/  /\/\::/  /\:\  \:\:\/__/     \/|::/  /::::/  /\::/\/__/\/_/:/  / ',
\'  \::/  /    \/__/   /:/  /  \:\__\::/  /        |:/  / L;;/__/  \:\__\    /:/  /  ',
\'   \/__/             \/__/    \/__/\/__/         \/__/            \/__/    \/__/   ',
\'',
\'',
\ ]

" Set colorscheme
colorscheme dracula

" Setting termguicolors and colorizer
set termguicolors

" Making the background transparent
hi Normal guibg=NONE ctermbg=NONE

" Using colorizer
lua require'colorizer'.setup()

" Setting key timeout
set timeout timeoutlen=1000

" Shortening the time to update after key triggers are ceased
set updatetime=100

" Setting blink frequency of cursor
set guicursor=a:blinkon200

" Showing line numbers
set number

" Setting tab size, indentation and notabstop
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Setting auto indentation
set autoindent

" Highlighting matching parentheses
set showmatch

" Highlighting the row and column of the cursor
set cursorline
set cursorcolumn

" 80th column indicator
set colorcolumn=80 "black"
highlight ColorColumn ctermbg= black guibg=black

" Column wrapping
set textwidth=80
" Turning off textwidth on certain filetypes
autocmd bufreadpre *.txt setlocal textwidth=0
autocmd bufreadpre *.html setlocal textwidth=0

" Search Configuration
set ignorecase
set smartcase

" Folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" set foldenable " Do not be folded on entering
set foldnestmax=10
set foldlevel=2

"===============================================================================
"								KEY MAPPINGS
"===============================================================================
"
" Calling netrw
noremap <silent> <C-E> :call ToggleNetrw()<CR>

" vim-motion 
" Move to character
map <LocalLeader>f <Plug>(easymotion-bd-f)
nmap <LocalLeader>f <Plug>(easymotion-overwin-f)

" Move to character-character
nmap <LocalLeader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <LocalLeader>L <Plug>(easymotion-bd-jk)
nmap <LocalLeader>l <Plug>(easymotion-overwin-line)

" Move to word
map <LocalLeader>w <Plug>(easymotion-bd-w)
nmap <LocalLeader>w <Plug>(easymotion-overwin-w)

" SymbolOutline Toggle
nnoremap <F3> :SymbolsOutline<CR>

" Trouble diagnostics keybindings
nnoremap <leader>xx <cmd>TroubleToggle<cr>
" nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
" nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
" nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
" nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" NERDCommenterToggle
nmap <leader><space> <plug>NERDCommenterToggle
vmap <leader><space> <plug>NERDCommenterToggle

" Defining the UndotreeToggle mapping
nnoremap  <leader>z : UndotreeToggle<CR>

" Keybinding for Isort
augroup IsortMappings
    autocmd!
    autocmd FileType python nnoremap <buffer> <Leader>si :Isort<CR>
    autocmd FileType python vnoremap <buffer> <Leader>si :Isort<CR>
augroup END

" Setting Esc as the terminal leaving command when terminal opened in nvim
tnoremap <Esc> <C-\><C-n>

" Using pandoc to open rendered documents in zathura
" nmap <Leader>pc :w <bar> :silent !pandoc --lua-filter=/opt/pandoc_scripts/color-text-span.lua --pdf-engine=xelatex -o %:r.pdf %<CR>

nmap <Leader>pc :w <bar> :silent !pandoc --lua-filter=/opt/pandoc_scripts/color-text-span.lua -o %:r.pdf %<CR>
" Opening a vertical split and opening the presently opened markdown file in
" it with mdp 
nnoremap MD :vs <CR>:term mdp %<CR>

" Having documents converted by Pandoc opened in zathura
nnoremap <Leader>pp :AsyncRun zathura %:r.pdf<CR>

" Some keybindings are defined under the lua sections of plugins
"
" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" VTerminal toggle
nnoremap <A-g> :call VTermToggle(50)<CR>
inoremap <A-g> <Esc>:call VTermToggle(50)<CR>
tnoremap <A-g> <C-\><C-n>:call VTermToggle(50)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope file_browser<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fs <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>

" minimap
nnoremap <leader>m :MinimapToggle<CR>
nnoremap <silent> <Esc> :nohlsearch<CR>:call minimap#vim#ClearColorSearch()<CR>
"===============================================================================
"							PLUGIN SETTINGS
"===============================================================================
"
" Do not open netrw on running neovim
let g:NetrwIsOpen = 0

" Netrw settings
let g:netrw_banner = 0 " No banner
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4 " Vertical split
let g:netrw_altv = 1
let g:netrw_winsize = 20

" Netrw toggle functionality on keypress
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Using default mappings for NERDCommenter
let g:NERDCreateDefaultMappings = 1 " True

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims=1 " True


" Setting UndoTreeSplitWidth
let g:undotree_SplitWidth=20

" Focusing on UndoTree when toggling
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif

" Setting rainbow brackets and disabling it for md files for syntax collapsing
let g:rainbow_active=1 " True
autocmd Filetype md let g:rainbow_active=0

" Defing browser to use to open MarkdownPreview
let g:mkdp_browser = 'brave-browser'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1

"Defing tex flavor to be used for vimtex
let g:tex_flavor = 'latex'
let g:vimtex_enabled=1

" vimwiki
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Header
let g:header_auto_add_header = 1 " Auto add
let g:header_field_filename = 0 " Do not show filename 

" minimap.vim
let g:minimap_git_colors = 1
let g:minimap_highlight_search = 1

" If buffer modified, update any 'Last Modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.

function! LastModified(path)
  if &modified
    let save_cursor = getpos(".")
    let n = min([10, line("$")]) " Check in the top 10 lines
    let path = a:path
    " Do not account for jump changes
    keepjumps 
        \ exe '1,' . n .
        \ 's#^\(.*\)\(Birth:\s*.*\)#\1' .
        \ substitute(system(['/home/workboots/.config/nvim/custom_helpers/get_timestamps', 'Birth', a:path]), '\n', '', 'g')

    keepjumps 
        \ exe '1,' . n .
        \ 's#^\(.*\)\(Modify:\s*.*\)#\1' .
        \ substitute(system(['/home/workboots/.config/nvim/custom_helpers/get_timestamps', 'Modify', a:path]), '\n', '', 'g')
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Vertical Git commit Function
let g:term_buf = 0
let g:term_win = 0
function! VTermToggle(width)
    if win_gotoid(g:term_win)
        hide
    else
        vsplit new
        exec "vertical resize " a:width
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


autocmd BufWritePre * call LastModified(expand('%'))

" lualine
lua << EOF
require("lualine").setup {
	options = {
		theme = 'dracula',
		}
}
EOF

" indent-blankline
lua << EOF
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#4D4D4D gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space: ")
vim.opt.listchars:append("eol:")

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" LSPs
lua << EOF
require("lspconfig").pylsp.setup{
}
require("lspconfig").vimls.setup{
}
require("lspconfig").ccls.setup{
}
require("lspconfig").tsserver.setup{
}
-- Disabling inline errors
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true
    }
)
EOF


lua << EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

EOF

" nvim-treesitter
lua << EOF
require("nvim-treesitter.configs").setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "python","c++","markdown","lua","vim","javascript",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- List of parsers to ignore installing

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

  },
}
EOF

" lsp-trouble
lua << EOF
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" symbols-outline
lua << EOF
vim.g.symbols_outline = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = true,
	position = 'right',
	relative_width = false,
	width = 30,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	preview_bg_highlight = 'Pmenu',
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = {"<Esc>", "q"},
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = {icon = "", hl = "TSURI"},
		Module = {icon = "", hl = "TSNamespace"},
		Namespace = {icon = "", hl = "TSNamespace"},
		Package = {icon = "", hl = "TSNamespace"},
		Class = {icon = "", hl = "TSType"},
		Method = {icon = "ƒ", hl = "TSMethod"},
		Property = {icon = "", hl = "TSMethod"},
		Field = {icon = "", hl = "TSField"},
		Constructor = {icon = "", hl = "TSConstructor"},
		Enum = {icon = "ℰ", hl = "TSType"},
		Interface = {icon = "ﰮ", hl = "TSType"},
		Function = {icon = "", hl = "TSFunction"},
		Variable = {icon = "", hl = "TSConstant"},
		Constant = {icon = "", hl = "TSConstant"},
		String = {icon = "", hl = "TSString"},
		Number = {icon = "#", hl = "TSNumber"},
		Boolean = {icon = "⊨", hl = "TSBoolean"},
		Array = {icon = "", hl = "TSConstant"},
		Object = {icon = "", hl = "TSType"},
		Key = {icon = "", hl = "TSType"},
		Null = {icon = "NULL", hl = "TSType"},
		EnumMember = {icon = "", hl = "TSField"},
		Struct = {icon = "", hl = "TSType"},
		Event = {icon = "🗲", hl = "TSType"},
		Operator = {icon = "+", hl = "TSOperator"},
		TypeParameter = {icon = "𝙏", hl = "TSParameter"}
	}
}
EOF

" telescope-file-browser
lua << EOF
  require("telescope").setup {
    extensions = {
      file_browser = {
        theme = "ivy",
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = false,
        },
    },
  }

  -- To get telescope-file-browser loaded and working with telescope,
  -- you need to call load_extension, somewhere after setup function:
  require("telescope").load_extension "file_browser"
EOF
