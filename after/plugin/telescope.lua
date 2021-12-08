local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- testing keymaps
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fds', ':Telescope lsp_document_symbols<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fws', ':Telescope lsp_workspace_symbols<CR>', { noremap = true, silent = true })

require("telescope").setup {
  defaults = {
    path_display = { "tail" },
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    },
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = false,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
        n = {
          ["<c-d>"] = actions.delete_buffer,
          ["dd"] = actions.delete_buffer,
        }
      }
    }
  }
}
