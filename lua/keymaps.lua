local term_opts = { silent = true }
local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Leader = spacebar
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Side explorer Space-e
keymap("n", "<Leader>e", ":NvimTreeOpen 30<cr>", opts)

-- Navigate the splits with Ctrl-wasd
keymap("n", "<C-a>", "<C-w>h", opts)
keymap("n", "<C-s>", "<C-w>j", opts)
keymap("n", "<C-w>", "<C-w>k", opts)
keymap("n", "<C-d>", "<C-w>l", opts)

-- Resize splits with Ctrl-arrows
keymap("n", "<C-Up>", ":resize -2<cr>", opts)
keymap("n", "<C-Down>", ":resize +2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Keep pressing for tab/untab
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected text up and down with Ctrl-Shift-Arrows
keymap("v", "<C-S-Up>" ,":m .-2<cr>gv=gv", opts)
keymap("v", "<C-S-Down>" ,":m .+1<cr>gv=gv", opts)
