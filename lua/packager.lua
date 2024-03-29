local opts = {
  lockfile = "/dev/null",
  performance = {
    rtp = {
      disabled_plugins = {
        -- https://neovim.io/doc/user/index.html#standard-plugin-list
        -- https://github.com/folke/lazy.nvim
        "gzip",
        "netrwPlugin",
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

  "ggandor/leap.nvim",
  "glacambre/firenvim",
  "andweeb/presence.nvim",
  "folke/tokyonight.nvim",
  "akinsho/bufferline.nvim",
  "lewis6991/spaceless.nvim",
  "nvim-lualine/lualine.nvim",
  "tzachar/highlight-undo.nvim",
  "max397574/better-escape.nvim",
  { "folke/which-key.nvim", lazy = true },
  { "rcarriga/nvim-notify", lazy = true },
  { "lewis6991/gitsigns.nvim", lazy = true },
  { "norcalli/nvim-colorizer.lua", lazy = true },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- Mini
  "echasnovski/mini.pairs",
  "echasnovski/mini.comment",

  -- Libraries
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim",

  -- LSP
  "neovim/nvim-lspconfig", "VonHeikemen/lsp-zero.nvim",

  -- Mason
  "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",

  -- Completion
  "hrsh7th/nvim-cmp", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip",

  -- Specific
  { "kaarmu/typst.vim", ft = "typst" }

}
require "lazy".setup(plugins, opts)
