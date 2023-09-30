local builtin = require("telescope.builtin")

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Disable highlight on Esc
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>", {
	silent = true,
	desc = "Disable highlighted groups for search",
})

-- Telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, {
	desc = "Telescope find files",
})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
	desc = "Telescope grep",
})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {
	desc = "Telescope show buffers",
})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
	desc = "Telescope help tags",
})
vim.keymap.set("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {
	desc = "Telescope fuzzy find current buffer",
})
vim.keymap.set("n", "<leader>ft", builtin.treesitter, {
	desc = "Telescope treesitter",
})

-- Telescope file-browser
vim.keymap.set("n", "<leader>fs", ":Telescope file_browser<CR>", {
	remap = false,
	desc = "Telescope file browser",
})


-- aerial.nvim
vim.keymap.set("n", "<leader>ai", "<CMD>AerialToggle<CR>", {
	desc = "Aerial toggle",
})
vim.keymap.set("n", "<leader>af", "<CMD>AerialNavToggle<CR>", {
desc = "Aerial Fold toggle",
})

-- Trouble
vim.keymap.set("n", "<leader>xx", "<CMD>TroubleToggle<CR>", {
	desc = "Trouble toggle",
})

-- nvim.tree
vim.keymap.set("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", {
	desc = "NvimTree toggle",
})

-- formatting
vim.keymap.set("n", "<localleader>f", "<CMD>lua vim.lsp.buf.format()<CR>", {
	desc = "LSP format",
})

-- neogen annotation/documentation
vim.keymap.set("n", "<leader>nf", "<CMD>lua require('neogen').generate()<CR>", {
	desc = "Neogen generate docstrings",
})

-- buffernavigation
vim.keymap.set("n", "gb", "<CMD>bnext<CR>", {
	desc = "next buffer",
})
vim.keymap.set("n", "gB", "<CMD>bprev<CR>", {
	desc = "previous buffer",
})

-- UndoTree
vim.keymap.set("n", "<leader>fu", vim.cmd.UndotreeToggle, {
	desc = "UndoTree toggle",
})

-- mini.map
vim.keymap.set("n", "<Leader>mc", MiniMap.close, {
	desc = "Minimap close",
})
vim.keymap.set("n", "<Leader>mf", MiniMap.toggle_focus, {
	desc = "Minimap focus toggle",
})
vim.keymap.set("n", "<Leader>mo", MiniMap.open, {
	desc = "Minimap open",
})
vim.keymap.set("n", "<Leader>mr", MiniMap.refresh, {
	desc = "Minimap refresh",
})
vim.keymap.set("n", "<Leader>ms", MiniMap.toggle_side, {
	desc = "Minimap toggle sides",
})
vim.keymap.set("n", "<Leader>mt", MiniMap.toggle, {
	desc = "Minimap toggle",
})
