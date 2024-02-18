require "catppuccin".setup {
  integrations = { notify = true },
  transparent_background = true,
  show_end_of_buffer = true,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = "0.10"
  },
}
vim.cmd.colo "catppuccin"

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
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators   = { left = "", right = "" },
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
  -- A|B|C   X|Y|Z ---
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {"filename"},
    lualine_x = {},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
