--[[ LSP-ZERO
It simplifies using LSP in Neovim
https://lsp-zero.netlify.app
--]]
local lspz = require "lsp-zero"

--- LSP ----------------------
-- Management
require "mason".setup {}
require "mason-lspconfig".setup {
  ensure_installed = { "lua_ls", "bashls", "typst_lsp" },
  handlers = { lspz.default_setup }
}
-- Init & setup
local lspc = require "lspconfig"
lspc.lua_ls.setup {}
lspc.bashls.setup { filetypes = { "sh", "zsh" } }
lspc.typst_lsp.setup {
  settings = {
    exportPdf = "onType" -- onType | onSave | never
  }
}
------------------------------

--- COMPLETION ---------------
local cmp = require "cmp"
cmp.setup {
  -- Preselect 1st item
  preselect = "item",
  completion = { completeopt = "menu,menuone,noinsert" },
  -- Sources
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" }
  },
  -- Menu look
  formatting = { fields = { "menu", "abbr", "kind" } },
  -- Mappings
  mapping = {
    ["<C-h>"] = cmp.mapping.abort(),
    ["<C-j>"] = cmp.mapping.select_next_item({behavior = "select"}),
    ["<C-k>"] = cmp.mapping.select_prev_item({behavior = "select"}),
    ["<C-l>"] = cmp.mapping.confirm(),
  }
}
------------------------------
