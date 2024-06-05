return {
	{
		"morhetz/gruvbox",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	"folke/tokyonight.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-surround",
	"folke/neodev.nvim",
	--"github/copilot.vim",
	{ "folke/which-key.nvim", opts = {} },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "center",
					path_display = { "truncate" },
					layout_config = {
						center = {
							width = 0.9,
							height = 0.95,
						},
						-- other layout configuration here
					},
				},
			})

			vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
			vim.keymap.set("n", "<leader>o", require("telescope.builtin").buffers, { desc = "[S]earch [B]uffers" })
			vim.keymap.set(
				"n",
				"<leader>ss",
				require("telescope.builtin").builtin,
				{ desc = "[S]earch [S]elect Telescope" }
			)
			vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
			vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set(
				"n",
				"<leader>sw",
				require("telescope.builtin").grep_string,
				{ desc = "[S]earch current [W]ord" }
			)
			vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set(
				"n",
				"<leader>sd",
				require("telescope.builtin").diagnostics,
				{ desc = "[S]earch [D]iagnostics" }
			)
			vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
