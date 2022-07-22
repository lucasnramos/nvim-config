local prettier_ok, prettier = pcall(require, "prettier")
local null_ls_ok, null_ls = pcall(require, "null-ls")

if not prettier_ok then return end
if not null_ls_ok then return end


-- configure null-ls to attach to the current buffer and enable autoformat and ]
-- prettier
null_ls.setup({
    on_attach = function(client, bufnr)
      print("null-ls")
      if client.resolved_capabilities.document_formatting then
        vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
        -- format on save
        vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
      end

      if client.resolved_capabilities.document_range_formatting then
        vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
      end
    end,
  })

prettier.setup({
    bin = 'prettier', -- or `prettierd`
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },
    arrow_parens = "always",
    bracket_spacing = true,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    print_width = 80,
})
