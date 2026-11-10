return {
  'nvim-treesitter/nvim-treesitter',
  -- `main` requires the tree-sitter CLI; `master` still works with Neovim 0.11+
  -- and installs pre-generated parsers with just a C compiler.
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      -- Parsers installed automatically on startup / when a filetype is opened.
      ensure_installed = {
        'typescript',
        'tsx',
        'javascript',
        'go',
        'lua',
        'c',
      },
      -- Install a parser automatically when a file of an unknown language is opened.
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
