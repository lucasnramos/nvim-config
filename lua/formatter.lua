local status, formatter = pcall(require, "formatter")

if not status then
	return
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},

		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
	},
})

-- Set format on save for file types inside of 'pattern'
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.lua" },
	callback = function()
		vim.cmd([[
      FormatWrite
    ]])
	end,
})
