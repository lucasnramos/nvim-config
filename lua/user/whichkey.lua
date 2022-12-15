local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

wk.register({
  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<cr>", "File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    g = { "<cmd>Telescope git_files<cr>", "Git File" },
    o = { "<cmd>Telescope buffers<cr>", "Buffers" },
    l = { "<cmd>Telescope live_grep<cr>", "Text" },
  },
  g = {
    name = "Git",
    s = { "<cmd>Git<CR>", "status" },
  },
  h = { "<cmd>nohlsearch<CR>", "Clear highlights" },
  e = { ":NvimTreeToggle<CR>", "File Explorer" },
  ["/"] = "Toggle Comment",
}, { prefix = "<leader>" })
wk.setup{}
