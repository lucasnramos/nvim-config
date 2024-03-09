return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
          callback = function(event) 
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end

            -- Keymaps only for LSP -> depends on Telescope
            map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
            map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
            map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
            map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
            map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            map('K', vim.lsp.buf.hover, 'Hover Documentation')
            map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          end
        }) -- on attach

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())


        -- Base server configs
        --
        local servers = {
          -- possible replacement here  https://github.com/pmizio/typescript-tools.nvim
          tsserver = {},
          lua_ls = {
            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },
                workspace = {
                  checkThirdParty = false,
                  -- Tells lua_ls where to find all the Lua files that you have loaded
                  -- for your neovim configuration.
                  library = {
                    '${3rd}/luv/library',
                    unpack(vim.api.nvim_get_runtime_file('', true)),
                  },
                  -- If lua_ls is really slow on your computer, you can try this instead:
                  -- library = { vim.env.VIMRUNTIME },
                },
                completion = {
                  callSnippet = 'Replace',
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
              },
            },
          },
        }

        -- start mason
        require('mason').setup()
        local ensure_installed = vim.tbl_keys(servers or {})

        require ('mason-tool-installer').setup { ensure_installed = ensure_installed }


        -- start mason  and configure the servers with overrides -> if any
        require('mason-lspconfig').setup {
          handlers = {
            function(server_name)
              local server = servers[server_name] or {}
              server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
              require('lspconfig')[server_name].setup(server)
            end,
          },
        }

        -- Autoformatting
        --
        {
          'stevearc/conform.nvim',
          opts = {
            notify_on_error = false,
            format_on_save = {
              timeout_ms = 500,
              lsp_fallback = true,
            },
            formatters_by_ft = {
              lua = { 'stylua' },
              javascript = { { "prettierd", "prettier" } },
              -- Conform can also run multiple formatters sequentially
              -- python = { "isort", "black" },
              --
              -- You can use a sub-list to tell conform to run *until* a formatter
              -- is found.
            },
          },
        }

        -- Autocompletion
        {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
          {
            'L3MON4D3/LuaSnip',
            build = (function()
              -- Build Step is needed for regex support in snippets
              -- This step is not supported in many windows environments
              -- Remove the below condition to re-enable on windows
              if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                return
              end
              return 'make install_jsregexp'
            end)(),
          },
          'saadparwaiz1/cmp_luasnip',

          -- Adds other completion capabilities.
          --  nvim-cmp does not ship with all sources by default. They are split
          --  into multiple repos for maintenance purposes.
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-path',

          -- If you want to add a bunch of pre-configured snippets,
          --    you can use this plugin to help you. It even has snippets
          --    for various frameworks/libraries/etc. but you will have to
          --    set up the ones that are useful for you.
          -- 'rafamadriz/friendly-snippets',
        },
        config = function()
          -- See `:help cmp`
          local cmp = require 'cmp'
          local luasnip = require 'luasnip'
          luasnip.config.setup {}

          cmp.setup {
            snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body)
              end,
            },
            completion = { completeopt = 'menu,menuone,noinsert' },

            -- For an understanding of why these mappings were
            -- chosen, you will need to read `:help ins-completion`
            --
            -- No, but seriously. Please read `:help ins-completion`, it is really good!
            mapping = cmp.mapping.preset.insert {
              ['<C-n>'] = cmp.mapping.select_next_item(),
              ['<C-p>'] = cmp.mapping.select_prev_item(),
              ['<C-y>'] = cmp.mapping.confirm { select = true },
              ['<C-Space>'] = cmp.mapping.complete {},

              -- Think of <c-l> as moving to the right of your snippet expansion.
              --  So if you have a snippet that's like:
              --  function $name($args)
              --    $body
              --  end
              --
              -- <c-l> will move you to the right of each of the expansion locations.
              -- <c-h> is similar, except moving you backwards.
              ['<C-l>'] = cmp.mapping(function()
                if luasnip.expand_or_locally_jumpable() then
                  luasnip.expand_or_jump()
                end
              end, { 'i', 's' }),
              ['<C-h>'] = cmp.mapping(function()
                if luasnip.locally_jumpable(-1) then
                  luasnip.jump(-1)
                end
              end, { 'i', 's' }),
            },
            sources = {
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
              { name = 'path' },
            },
          }
        end
      }
      end -- config function
    },

  }
}

