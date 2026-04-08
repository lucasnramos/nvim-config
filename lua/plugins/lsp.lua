return {
	'neovim/nvim-lspconfig',
	dependencies = {
		{
			'mason-org/mason.nvim',
			opts = {},
		},
		-- Maps LSP server names between nvim-lspconfig and Mason package names.
		'mason-org/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',
	},
	config = function()
		--    function will be executed to configure the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or 'n'
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
				end

				map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
				map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
				map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
				map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
				map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
				map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

			end,
		})

		local servers = {
			lua_ls = {},
			gopls = {
				filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
			},
			pyright = {},
			-- ts_ls = {} -- OR https://github.com/pmizio/typescript-tools.nvim
		}
		local ensure_installed = vim.tbl_keys(servers or {})

		require('mason-tool-installer').setup { ensure_installed = ensure_installed }

		for name, server in pairs(servers) do
			vim.lsp.config(name, server)
			vim.lsp.enable(name)
		end
	end
}
