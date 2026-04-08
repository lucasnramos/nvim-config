return {
	{
		"p00f/alabaster.nvim",
		lazy = false,
		priority = 1000,
		config = function() vim.cmd.colorscheme 'alabaster' end,
	},
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	{ "folke/which-key.nvim", opts = {} },
}
