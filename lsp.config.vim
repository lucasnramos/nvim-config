lua << EOF
local nvim_lsp = require('lspconfig')
require'lspconfig'.tsserver.setup{}
EOF
