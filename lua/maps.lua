vim.g.mapleader = " "
--- UMAP WRAPPER -------------
-- Avoid duplicated remaps
local function umap(modes, lhs, rhs, opts)
	if not opts then opts = {} end
	if opts.unique == nil then opts.unique = true end
	vim.keymap.set(modes, lhs, rhs, opts)
end
------------------------------

--- LSP ----------------------
local vl = vim.lsp
-- Show info about hovered symbol with f instead of K
umap({"n", "v"}, "f", vl.buf.hover)
-- Format buffer
umap({"n", "v"}, "F", vl.buf.format)
-- Trigger code action
umap({"n", "v"}, "t", vl.buf.code_action)
------------------------------

--- GITSIGNS -----------------
umap("n", "gh", ":Gitsigns preview_hunk inline<CR>")
umap("n", "gb", ":Gitsigns toggle_current_line_blame<CR>")
------------------------------

--- N MODE -------------------
-- Globally delete lines with string
umap("n", "<leader>S", [[:g/<C-r><C-w>/d]])
-- Globally replace string
umap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
------------------------------

--- C MODE -------------------
umap("c", "<C-h>", "<ESC>")
umap("c", "<C-j>", "<Down>")
umap("c", "<C-k>", "<Up>")
umap("c", "<C-l>", "<CR>")
------------------------------

--- N, V, S MODES ------------
-- Replace cmdline with cmdline-window with better mappings
umap({"n", "v"}, ";", "q:")
umap({"n", "v"}, "/", "q/")
umap({"n", "v"}, "?", "q?")
umap({"n", "v"}, ":", "<cmd><Up><CR>")
-- Properly "amplify" HJKL
umap({"n", "v"}, "H", "0^")
umap({"n", "v"}, "J", "5j")
umap({"n", "v"}, "K", "5k")
umap({"n", "v"}, "L", "$")
-- Switch matches keeping cursor centered
umap({"n", "v"}, "n", "nzzzv")
umap({"n", "v"}, "N", "Nzzzv")
-- Source file
umap({"n", "v"}, "<leader><leader>", ":so %<CR>")
-- Make file executable
umap({"n", "v"}, "<leader>x", ":silent !chmod +x %<CR>")
------------------------------

--- ALWAYS -------------------
-- Unhightlight search matches
umap({"n", "v", "i"}, "<C-s>", vim.cmd.nohl)
-- Append line below to current line
umap({"n", "v", "i"}, "<C-a>", "J")
------------------------------

--- VOID REGISTERING ---------
-- Deleting
umap({"n", "v"}, "x", [["_x]])
umap({"n", "v"}, "X", [["_X]])
umap({"n", "v"}, "<leader>d", [["_d]])
umap({"n", "v"}, "<leader>D", [["_D]])
-- Yanking
umap({"n", "v"}, "<leader>p", [["_dP]])
------------------------------
