local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = function ()
            -- vim.keymap.set only for 0.7+
            -- Set "K" to show lsp hover, if we attached to an Language Server
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        end
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    if server.name == "html" then
        opts.filetypes = { "html", "php" }
    end
    server:setup(opts)
end)
