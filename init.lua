--- AUTO LAZY DEPLOY
local dir = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(dir) then vim.fn.system {"git","clone","--filter=blob:none","https://github.com/folke/lazy.nvim.git","--branch=stable",dir} end
vim.opt.rtp:prepend(dir)

--[[ WARNING
Make sure not to use the same keyword
as some plugins setup command as they
use also use require in it
--]]
require "opts"
require "maps"
require "packager"
require "plugins"
require "lsp"
require "ui"
