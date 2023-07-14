-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- General settings:
--------------------

-- Set formatoptions
autocmd("FileType", {
	pattern = "",
	command = "set formatoptions=tcqj",
})

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	group = "YankHighlight",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "1000" })
	end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
	pattern = "",
	command = ":%s/\\s\\+$//e",
})

-- Settings for filetypes:
--------------------------

-- Disable line length marker and textwidth
augroup("setLineLength", { clear = true })
autocmd("Filetype", {
	group = "setLineLength",
	pattern = { "text", "html", "xhtml", "javascript", "typescript", "shell", "sh" },
	command = "setlocal textwidth=0 colorcolumn=0",
})

-- Open all folds on entering

autocmd("BufWinEnter", {
	pattern = "*",
	command = "normal zR",
})

-- Persistent folds

local save_fold = augroup("Persistent Folds", { clear = true })
autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd.mkview()
	end,
	group = save_fold,
})
autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
	group = save_fold,
})
