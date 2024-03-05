vim.opt.termguicolors = true
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

vim.notify = require "notify"
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
    lualine_a = { 'mode'},
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
