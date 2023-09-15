local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = { height = 0.95 },
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },
	},
})
