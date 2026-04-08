-- [[ Initial Options ]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
-- vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false


-- [[ Keymaps ]]
local opts = { silent = true }
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>h', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>l', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set({ 'n', 'v', 'x' }, 'ç', ';')
vim.keymap.set({ 'n', 'v', 'x' }, 'Ç', ':')
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<S-l>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-h>', ':bprevious<CR>', opts)
vim.keymap.set('i', 'jk', '<ESC>', opts)
vim.keymap.set('i', '<A-h>', '<Left>')
vim.keymap.set('i', '<A-l>', '<Right>')
vim.keymap.set('i', '<A-j>', '<Down>')
vim.keymap.set('i', '<A-k>', '<Up>')
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y', opts)
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p', opts)
vim.keymap.set('c', '<A-h>', '<Left>')
vim.keymap.set('c', '<A-l>', '<Right>')
vim.keymap.set('c', '<A-j>', '<Down>')
vim.keymap.set('c', '<A-k>', '<Up>')
-- copy current file name to the system clipboard
vim.keymap.set('n', '<leader>fl', ':call setreg("+", @%)<CR>', opts)

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup("plugins")
