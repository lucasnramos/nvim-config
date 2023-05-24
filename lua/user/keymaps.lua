-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
 
-- To set leader key maps, use whichkey.lua

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Change command line keymap
keymap({ "n", "v","x" }, ";", ":")
keymap({ "n", "v","x" }, ":", ";")
keymap({ "n", "v","x" }, "ç", ":")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)


-- Close buffers
keymap("n", "<S-q>", "<cmd>bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Nvim tree

-- Insert --
-- Press jk fast to enter normal mode
keymap("i", "jk", "<ESC>", opts)
-- Navigate with hjkl in insert mode
keymap("i", "<A-h>", "<Left>")
keymap("i", "<A-l>", "<Right>")
keymap("i", "<A-j>", "<Down>")
keymap("i", "<A-k>", "<Up>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)


-- Command line
-- Navigate with hjkl
keymap("c", "<A-h>", "<Left>")
keymap("c", "<A-l>", "<Right>")
keymap("c", "<A-j>", "<Down>")
keymap("c", "<A-k>", "<Up>")

-- Plugins --

-- Telescope
keymap({ "n", "v" }, "<C-p>", ":Telescope find_files<CR>", opts)
keymap({ "n", "v" }, "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fa", ":Telescope builtin<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

