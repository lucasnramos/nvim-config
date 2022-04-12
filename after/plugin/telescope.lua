local status_ok = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

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
  extensions = {}
}

