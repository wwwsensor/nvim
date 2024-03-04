--- LSP-ZERO -----------------
-- https://lsp-zero.netlify.app
-- Enable default LSP mappings at attachment
local lsp_zero = require "lsp-zero"
lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)
------------------------------

-- LS ------------------------
-- Install
require "mason".setup {}
require "mason-lspconfig".setup {
  handlers = { lsp_zero.default_setup },
  ensure_installed = { "lua_ls", "bashls" }
}
-- Init & setup
local ls = require "lspconfig"
ls.lua_ls.setup {}
ls.bashls.setup { filetypes = { "sh", "zsh" } }
------------------------------

-- CMP -----------------------
local cmp = require "cmp"
local cmp_action = require "lsp-zero".cmp_action()
cmp.setup {
  -- Format
  formatting = { fields = { "menu", "abbr", "kind" } },
  -- Sources
  sources = {
    { name = "nvim_lsp" }, { name = "luasnip" },
    { name = "buffer" }, { name = "path" }
  },
  -- Mappings
  mapping = {
    ["<Tab>"] = cmp_action.tab_complete(),
    ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
    ["<C-h>"] = cmp.mapping.abort(),
    ["<C-j>"] = cmp.mapping(function()
      if cmp.visible() then cmp.select_next_item({behavior = "insert"})
      else cmp.complete() end
    end),
    ["<C-k>"] = cmp.mapping(function()
      if cmp.visible() then cmp.select_prev_item({behavior = "insert"})
      else cmp.complete() end
    end),
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
