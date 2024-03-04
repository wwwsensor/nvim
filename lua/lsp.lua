--- LSP ----------------------
-- Management
-- LSP-ZERO : https://lsp-zero.netlify.app
local lspz = require "lsp-zero"
require "mason".setup {}
require "mason-lspconfig".setup {
  ensure_installed = { "lua_ls", "bashls" },
  handlers = { lspz.default_setup }
}
-- Init & setup
local lspc = require "lspconfig"
lspc.lua_ls.setup {}
lspc.bashls.setup { filetypes = { "sh", "zsh" } }
------------------------------

--- COMPLETION ---------------
local cmp = require "cmp"
local cmp_action = lspz.cmp_action()
cmp.setup {
  completion = { completeopt = "menu,menuone,noinsert" },
  formatting = { fields = { "menu", "abbr", "kind" } },
  preselect = "item",
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" }
  },
  mapping = {
    ["<C-h>"] = cmp.mapping.abort(),
    ["<C-j>"] = cmp_action.luasnip_supertab(),
    ["<C-k>"] = cmp_action.luasnip_shift_supertab(),
    ["<C-l>"] = cmp.mapping.confirm({select = false}),
  },
  -- Snippets
  snippet = {
    expand = function(args)
      require "luasnip".lsp_expand(args.body)
    end
  }
}
------------------------------
