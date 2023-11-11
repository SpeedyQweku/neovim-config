local keymap = vim.keymap -- for conciseness

-- Set leader key
vim.g.mapleader = " "

-- Toggle line numbers
keymap.set("n", "<leader>n", ":set invnumber invrelativenumber<CR>")

-- Run the current line as a shell command, replace with the output
keymap.set("n", "Q", "!!zsh<CR>")

-- Paste replace visual selection without copying it
keymap.set("v", "p", '"_dP')

-- see whitespaces,tabs and newlines
keymap.set("n", "<leader><TAB>", ":set invlist<CR>")

-- Disable the arrow keys
keymap.set("n", "<Left>", ":echo 'use h ya twat'<CR>")
keymap.set("n", "<Right>", ":echo 'use l ya twat'<CR>")
keymap.set("n", "<Up>", ":echo 'use k ya twat'<CR>")
keymap.set("n", "<Down>", ":echo 'use j ya twat'<CR>")

-- window management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

-- Move lines up and down
keymap.set("n", "<A-j>", ":move .+1<CR>==")
keymap.set("n", "<A-k>", ":move .-2<CR>==")
keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- Set jk to esc
keymap.set("i", "jk", "<ESC>")

-- keymap.set("n", "K", function()
-- 	require("lsp_signature").toggle_float_win()
-- end, { silent = false, noremap = true, desc = "toggle signature" })

-- keymap.set({ "n" }, "<Leader>k", function()
-- 	vim.lsp.buf.signature_help()
-- end, { silent = false, noremap = true, desc = "toggle signature" })
