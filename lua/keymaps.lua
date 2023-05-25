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

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Deleting with "x" will not yank
keymap("n", "x", '"_x')

-- Close buffers
keymap("n", "<S-q>", "<cmd>bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

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
-- move selected lines up/down live vscode
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Command line
-- Navigate with hjkl
keymap("c", "<A-h>", "<Left>")
keymap("c", "<A-l>", "<Right>")
keymap("c", "<A-j>", "<Down>")
keymap("c", "<A-k>", "<Up>")

-- Plugins --

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-e>", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fsf", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>fa", ":Telescope builtin<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fds", ":Telescope lsp_document_symbols<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap({ "v", "x" }, "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- LSP
keymap("n", "<space>e", vim.diagnostic.open_float)
keymap("n", "[d", vim.diagnostic.goto_prev)
keymap("n", "]d", vim.diagnostic.goto_next)

-- Only setup these when LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		keymap("n", "gD", vim.lsp.buf.declaration, opts)
		keymap("n", "gd", vim.lsp.buf.definition, opts)
		keymap("n", "K", vim.lsp.buf.hover, opts)
		keymap("n", "gi", vim.lsp.buf.implementation, opts)
		keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		keymap("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		keymap("n", "<space>D", vim.lsp.buf.type_definition, opts)
		keymap("n", "<space>rn", vim.lsp.buf.rename, opts)
		keymap({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		keymap("n", "gr", vim.lsp.buf.references, opts)
		keymap("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
