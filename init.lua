-- vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
-- vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
-- vim.opt.confirm = true -- Confirm unsaved changes before exiting
-- vim.opt.fileencoding = "utf-8" -- the encoding written to a file
-- vim.opt.hlsearch = false -- highlight all matches on previous search pattern
-- vim.opt.ignorecase = true -- ignore case in search patterns
-- vim.opt.mouse = "a" -- allow the mouse to be used in neovim
-- vim.opt.pumheight = 10 -- pop up menu height
-- vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
-- vim.opt.showtabline = 0 -- always show tabs
-- vim.opt.smartcase = true -- smart case
-- vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
-- vim.opt.timeoutlen = 200
-- vim.opt.undofile = true -- enable persistent undo
-- vim.opt.updatetime = 300 -- faster completion (4000ms default)
-- vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- Keymaps
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
keymap("n", ";", ":")
keymap("v", ";", ":")
keymap("x", ";", ":")
keymap("n", "ç", ":")
keymap("v", "ç", ":")
keymap("x", "ç", ":")

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Deleting with "x" will not yank
keymap("n", "x", '"_x')

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)