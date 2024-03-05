--- AUTO LAZY DEPLOYMENT -----
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then vim.fn.system {"git","clone","--filter=blob:none","https://github.com/folke/lazy.nvim.git","--branch=stable",lazypath} end
vim.opt.rtp:prepend(lazypath)
------------------------------

--- PLUGINS ------------------
require "lazy".setup {

  "ggandor/leap.nvim",
  "whatyouhide/vim-gotham",
  "nvim-lualine/lualine.nvim",
  "xiyaowong/transparent.nvim",
  "tzachar/highlight-undo.nvim",
  "max397574/better-escape.nvim",
  { "folke/which-key.nvim", lazy = true },
  { "rcarriga/nvim-notify", lazy = true },
  { "nvimtools/none-ls.nvim", lazy = true },
  { "lewis6991/gitsigns.nvim", lazy = true },
  { "chrisgrieser/nvim-spider", lazy = true },
  { "norcalli/nvim-colorizer.lua", lazy = true },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Libraries
  "nvim-lua/plenary.nvim",

  -- LSP
  "neovim/nvim-lspconfig", "VonHeikemen/lsp-zero.nvim",

  -- Mason
  "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",

  -- Completion
  "hrsh7th/nvim-cmp", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip",

  -- Specific
  { "chomosuke/typst-preview.nvim", lazy = true }

}
------------------------------

--[[ WARNING
Some plugins use the require command to setup
themselves, so make sure you call files which
doesn't match the name of the plugins exactly
--]]
require "ui" require "lsp" require "plugins" require "maps" require "opts"


---------- REMINDER TO USE A NEW STATUS & BUFFER LINE
