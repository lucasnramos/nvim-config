
require("telescope").setup {
  defaults = {
    path_display = { "smart" }
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = false,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          -- or right hand side can also be the name of the action as string
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          ["dd"] = require("telescope.actions").delete_buffer,
        }
      }
    }
  }
}
