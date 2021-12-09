local lsp_installer = require("nvim-lsp-installer")
local map_opts = { noremap = true, silent = true }
local function map(...) vim.api.nvim_set_keymap(...) end

map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', map_opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', map_opts)
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', map_opts)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', map_opts)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', map_opts)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', map_opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', map_opts)
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', map_opts)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', map_opts)
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', map_opts)
map('n', '[[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', map_opts)
map('n', ']]', '<cmd>lua vim.diagnostic.goto_next()<CR>', map_opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', map_opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', map_opts)

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
