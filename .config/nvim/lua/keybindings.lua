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
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})

-- Telescope file-browser
vim.keymap.set("n", "<leader>fs", ":Telescope file_browser<CR>", { noremap = true })

-- hop
vim.keymap.set("", "<leader>w", "<CMD>HopPattern<CR>", { remap = true })

-- aerial.nvim
vim.keymap.set("n", "<leader>si", "<CMD>AerialToggle<CR>", {})
vim.keymap.set("n", "<leader>sf", "<CMD>AerialNavToggle<CR>", {})

-- Trouble
vim.keymap.set("n", "<leader>xx", "<CMD>TroubleToggle<CR>", {})

-- nvim.tree
vim.keymap.set("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", {})

-- formatting
vim.keymap.set("n", "<localleader>f", "<CMD>lua vim.lsp.buf.format()<CR>", {})

-- neogen annotation/documentation
vim.keymap.set("n", "<leader>nf", "<CMD>lua require('neogen').generate()<CR>", {})

-- buffernavigation
vim.keymap.set("n", "gb", "<CMD>bnext<CR>", {})
vim.keymap.set("n", "gB", "<CMD>bprev<CR>", {})

-- UndoTree
vim.keymap.set("n", "<leader>fu", vim.cmd.UndotreeToggle)

-- mini.map
vim.keymap.set("n", "<Leader>mc", MiniMap.close)
vim.keymap.set("n", "<Leader>mf", MiniMap.toggle_focus)
vim.keymap.set("n", "<Leader>mo", MiniMap.open)
vim.keymap.set("n", "<Leader>mr", MiniMap.refresh)
vim.keymap.set("n", "<Leader>ms", MiniMap.toggle_side)
vim.keymap.set("n", "<Leader>mt", MiniMap.toggle)
