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
-- Show info about hovered symbol with f instead of K
umap("n", "f", vim.lsp.buf.hover)
-- Format buffer
umap("n", "<leader>gf", vim.lsp.buf.format)
-- Trigger code action
umap({"n", "v"}, "gc", vim.lsp.buf.code_action)
------------------------------

-- SPIDER --------------------
umap({"n", "o", "x"}, "w", ":lua require 'spider'.motion 'w'<CR>")
umap({"n", "o", "x"}, "e", ":lua require 'spider'.motion 'e'<CR>")
umap({"n", "o", "x"}, "b", ":lua require 'spider'.motion 'b'<CR>")
------------------------------

--- GITSIGNS -----------------
umap("n", "gh", ":Gitsigns preview_hunk inline<CR>") umap("n", "gb", ":Gitsigns toggle_current_line_blame<CR>")
------------------------------

-- Properly "amplify" HJKL
umap({"n", "v"}, "J", "6j") umap({"n", "v"}, "K", "6k") umap({"n", "v"}, "H", "0^") umap({"n", "v"}, "L", "$")
-- Globally replace string
umap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Make file executable
umap("n", "<leader>x", ":silent !chmod +x %<CR>")
-- Unhightlight search
umap({"n", "i", "v"}, "<C-s>", vim.cmd.nohl)
-- Source file
umap("n", "<leader><leader>", ":so %<CR>")
-- Globally delete lines with string
umap("n", "<leader>S", [[:g/<C-r><C-w>/d]])
-- Switch matches keeping cursor centered
umap("n", "n", "nzzzv")
umap("n", "N", "Nzzzv")
-- Del into void register
umap({"n", "v"}, "<leader>d", [["_d]])
umap({"n", "v"}, "<leader>D", [["_D]])
umap("n", "x", [["_x]])
-- Yank into void register
umap("x", "<leader>p", [["_dP]])
-- Append line below to current line
umap("n", "<C-a>", "J")
-- Demap Q
umap("n", "Q", "<nop>")
