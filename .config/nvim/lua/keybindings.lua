local builtin = require("telescope.builtin")

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Disable highlight on Esc
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>", { silent = true })

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

-- hop
vim.keymap.set("", "<leader>w", "<CMD>HopPattern<CR>", { remap = true })

-- Symbols Outline
vim.keymap.set("n", "<leader>si", "<CMD>SymbolsOutline<CR>", {})

-- Trouble
vim.keymap.set("n", "<leader>xx", "<CMD>TroubleToggle<CR>", {})

-- nvim.tree
vim.keymap.set("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", {})

-- formatting
vim.keymap.set("n", "<localleader>f", "<CMD>lua vim.lsp.buf.format()<CR>", {})

-- neogen annotation/documentation
vim.keymap.set("n", "<leader>nf", "<CMD>lua require('neogen').generate()<CR>", {})
