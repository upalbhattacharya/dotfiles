require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
local trouble = require("trouble")

-- lspconfigs
lspconfig.pylsp.setup{}
lspconfig.yamlls.setup{}
lspconfig.lua_ls.setup{}
lspconfig.jsonls.setup{}
lspconfig.bashls.setup{}

trouble.setup{}
