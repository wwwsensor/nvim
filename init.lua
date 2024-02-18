--- AUTO LAZY DEPLOYMENT -----
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then vim.fn.system {"git","clone","--filter=blob:none","https://github.com/folke/lazy.nvim.git","--branch=stable",lazypath} end
vim.opt.rtp:prepend(lazypath)
------------------------------

--- PLUGINS ------------------
require "lazy".setup {
  -- Libraries
  "nvim-lua/plenary.nvim",

  -- Mappings helper
  "folke/which-key.nvim",
  -- Git previewer
  "lewis6991/gitsigns.nvim",
  -- Animate undo
  "tzachar/highlight-undo.nvim",
  -- Colorize color codes
  "norcalli/nvim-colorizer.lua",
  -- Ultimate motions and quicker normal mode
  "ggandor/leap.nvim", "max397574/better-escape.nvim",
  -- Move by subwords and skip insignificant punctuation
  { "chrisgrieser/nvim-spider", lazy = true },
  -- Ultimate highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  -- Colorscheme, nicer notifications and statusline
  "catppuccin/nvim", "rcarriga/nvim-notify", "nvim-lualine/lualine.nvim",

  -- LSP
  "neovim/nvim-lspconfig", "VonHeikemen/lsp-zero.nvim",
  -- Mason
  "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "nvimtools/none-ls.nvim",
  -- Completion
  "hrsh7th/nvim-cmp", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip",

  -- Typst
  "chomosuke/typst-preview.nvim",
}
------------------------------

--[[ WARNING
Some plugins use the require command to setup
themselves, so make sure you call files which
doesn't match the name of the plugins exactly
--]]
require "ui" require "lsp" require "plugins" require "maps" require "opts"
