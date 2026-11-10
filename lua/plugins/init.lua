return {
	{
		"p00f/alabaster.nvim",
		lazy = false,
		priority = 1000,
        -- config = function() vim.cmd.colorscheme 'alabaster' end,
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
        config = function() vim.cmd.colorscheme 'moonfly' end,
	},
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	{ "folke/which-key.nvim", opts = {} },
}
