local opts = {
  performance = {
    rtp = {
      disabled_plugins = {
        -- https://neovim.io/doc/user/index.html#standard-plugin-list
        -- https://folke/lazy.nvim
        "gzip",
        "netrwPliugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      }
    }
  }
}
local plugins = {

  "folke/noice.nvim",
  "ggandor/leap.nvim",
  "folke/tokyonight.nvim",
  "nvim-lualine/lualine.nvim",
  "tzachar/highlight-undo.nvim",
  "max397574/better-escape.nvim",
  { "folke/which-key.nvim", lazy = true },
  { "rcarriga/nvim-notify", lazy = true },
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
require "lazy".setup(plugins, opts)
