require "tokyonight".setup {
  style = "night",
  transparent = true,
  light_style = "day",
  lualine_bold = true,
  styles = { sidebars = "transparent" },
  -- Replace inactive statuslines with a thin border
  hide_inactive_statusline = false
}
vim.cmd.colo "tokyonight"

require "notify".setup {
  background_colour = "NotifyBackground",
  fps = 144,
  icons = { DEBUG = "", ERROR = "", INFO = "", TRACE = "✎", WARN = "" },
  level = 2,
  minimum_width = 30,
  render = "default",
  stages = "slide",
  time_formats = { notification = "%T", notification_history = "%F %T" },
  timeout = 6000,
  top_down = true
}
vim.notify = require "notify"

require "lualine".setup {
  options = {
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'location', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {'progress'},
    lualine_z = {'branch'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require "noice".setup {
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
  },
  cmdline = { enabled = false }
}
