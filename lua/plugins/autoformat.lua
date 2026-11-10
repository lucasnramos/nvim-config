-- Set to false to disable formatting on save without touching anything else.
local format_on_save = true

-- Return nil to skip format-on-save for a buffer, or a table of options to run it.
local function format_on_save_opts(bufnr)
	-- Languages without a well-standardized style; add more here if needed.
	local disable_filetypes = { c = true, cpp = true }
	if disable_filetypes[vim.bo[bufnr].filetype] then
		return nil
	end
	return {
		timeout_ms = 500,
		lsp_format = 'fallback',
	}
end

return {
	'stevearc/conform.nvim',
	event = { 'BufWritePre' },
	cmd = { 'ConformInfo' },
	keys = {
		{
			'<leader>ff',
			function() require('conform').format { async = true, lsp_format = 'fallback' } end,
			mode = '',
			desc = '[F]ormat [f]ile',
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = format_on_save and format_on_save_opts or false,
		formatters_by_ft = {
			lua = { 'stylua' },
			javascript = { 'prettier' },
			typescript = { 'prettier' },
			css = { 'prettier' },
			html = { 'prettier' },
			scss = { 'prettier' },
		},
	},

}
