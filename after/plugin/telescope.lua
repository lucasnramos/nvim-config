local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

-- testing keymaps
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tp', ':Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tb', ':Telescope builtin<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tl', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>th', ':Telescope help_tags<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tff', ':Telescope git_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tfs', ':Telescope lsp_document_symbols<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tfws', ':Telescope lsp_workspace_symbols<CR>', { noremap = true, silent = true })

require("telescope").setup {
  defaults = {
    path_display = { "smart" },
    preview = false,
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
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,  -- override the generic sorter
      override_file_sorter = false,     -- override the file sorter
    }
  }
}

require('telescope').load_extension('fzy_native')

