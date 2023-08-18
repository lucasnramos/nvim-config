local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim" }) -- Add comments
	use({ "kyazdani42/nvim-web-devicons" })
	use { "akinsho/bufferline.nvim" } -- Show editors as tabs and allow better navigation
	use { "nvim-lualine/lualine.nvim" } -- statusbar
	use({ "folke/which-key.nvim" })

	-- Vim compat
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-surround" })
	use({ "mattn/emmet-vim" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim", config = function() vim.cmd("colorscheme tokyonight") end})
	use({ "lunarvim/darkplus.nvim" })
	use({ "doums/darcula" })
	use({ "bluz71/vim-nightfly-guicolors" })

	-- Telescope
	-- use({ "nvim-telescope/telescope.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)