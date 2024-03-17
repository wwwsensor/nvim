vim.g.mapleader = " "
--- UMAP WRAPPER -------------
-- Avoid duplicated remaps
local function umap(modes, lhs, rhs, opts)
	if not opts then opts = {} end
	if opts.unique == nil then opts.unique = true end
	vim.keymap.set(modes, lhs, rhs, opts)
end
------------------------------

--- PLUGINS ------------------
-- Typst
vim.cmd 'autocmd BufNewFile,BufRead *.typ lua vim.keymap.set("n", "|", ":TypstWatch<CR>")'
-- LSP
local vl = vim.lsp
umap({"n", "v"}, "<leader>a", vl.buf.code_action) -- trigger code action
umap({"n", "v"}, "t", vl.buf.hover) -- get info of hovered symbol
umap({"n", "v"}, "T", vl.buf.format) -- format buffer
-- Gitsigns
umap({"n", "v"}, "gb", ":Gitsigns toggle_current_line_blame<CR>")
umap({"n", "v"}, "gh", ":Gitsigns preview_hunk inline<CR>")
-- Leap.nvim - See :h leap-custom-mappings
umap({"n", "x", "o"}, "gw", "<Plug>(leap-from-window)")
umap({"n", "x", "o"}, "F", "<Plug>(leap-backward)")
umap({"n", "x", "o"}, "f", "<Plug>(leap-forward)")
------------------------------

--- N ------------------------
-- Replace string in buffer
umap("n", "<leader>cw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Delete lines with string in buffer
umap("n", "<leader>cc", [[:g/<C-r><C-w>/d]])
------------------------------

--- QOL ----------------------
-- Make file executable
umap({"n", "v"}, "<leader><leader>", ":silent !chmod +x %<CR>")
-- Unhightlight search matches
umap({"n", "v", "i"}, "<C-s>", vim.cmd.nohl)
-- Delete to void register
umap({"n", "v"}, "x", [["_x]])
umap({"n", "v"}, "X", [["_X]])
umap({"n", "v"}, "<leader>d", [["_d]])
umap({"n", "v"}, "<leader>D", [["_D]])
-- Switch matches with centered cursor
umap({"n", "v"}, "n", "nzzzv")
umap({"n", "v"}, "N", "Nzzzv")
-- Append line below to current line
umap({"n", "v"}, "<C-a>", "J")
-- Re-run last command
umap({"n", "v"}, ":", ":<Up><CR>")
-- Amplified hjkl
umap({"n", "v"}, "H", "0^")
umap({"n", "v"}, "J", "5j")
umap({"n", "v"}, "K", "5k")
umap({"n", "v"}, "L", "$")
------------------------------

--[[ WARNING
This replaces cmdline with cmdline-window
This means cmdline mode doesn't exist now
--]]
umap({"n", "v"}, ";", "q:a")
umap({"n", "v"}, "/", "q/a")
umap({"n", "v"}, "?", "q?a")
umap({"n", "v", "i" }, "<C-c>", "<C-c><C-c>")
