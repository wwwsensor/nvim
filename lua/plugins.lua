require "nvim-treesitter.configs".setup {
  -- Parsers (can use `all`) (1-5 mandatory)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "bash", "toml", "json", "yaml" },
  auto_install = false,
  highlight = {
    enable = true,
    -- Disable treesitter if file is too big
    disable = function(lang, buf)
      local max_filesize = 200000 * 1024 -- 200000 KB / 200 MB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then return true end
    end
  }
}

require "gitsigns".setup { preview_config = { border = { " ", "", " ", " ", " ", " ", " ", " " }, row = 1, col = 1, } }
require "highlight-undo".setup {} require "typst-preview".setup {} require "leap".create_default_mappings {}
require "better_escape".setup { mapping = { "jk", "jK", "Jk", "JK" } }
require "which-key".setup {} require "colorizer".setup ()
