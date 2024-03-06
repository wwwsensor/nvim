--[[ LUA-NVIM-VIM API
Variables: https://neovim.io/doc/user/lua-guide.html#lua-guide-variables
Options: https://neovim.io/doc/user/quickref.html#Q_op
--]]

local o = vim.opt

-- Max time to link keys for a sequence (ms)
vim.g.timeoutlen = 850

-- Height of normal or window cmdline : https://neovim.io/doc/user/cmdline.html#cmdline-window
o.cmdwinheight = 1
o.cmdheight = 0

-- Share clipboard with sys
o.clipboard:append "unnamedplus"

-- Empty side char for margins
o.fillchars = "eob:·"

-- 24-bit colors
vim.opt.termguicolors = true

-- Vert scrolling margin
o.scrolloff = 8

-- Autoindent
o.autoindent = true
o.shiftwidth = 2

-- Use spaces
o.expandtab = true

-- Tabs
o.smarttab = true
o.tabstop = 2

-- Disable mouse
o.mouse = ""

-- Disable wrap
o.wrap = false
