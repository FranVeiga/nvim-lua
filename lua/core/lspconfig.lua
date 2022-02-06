-- Setup lspconfig.


local nvim_lsp = require 'lspconfig'
local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'clangd', 'pyright', 'tsserver', 'bashls', 'vimls', 'html', 'cssls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local rust_analyzer_path = vim.fn.getenv 'HOME' .. '/.local/share/nvim/lsp_servers/rust/rust-analyzer' -- Change to your rust_analyzer root installation

require('lspconfig').rust_analyzer.setup {
  cmd = {rust_analyzer_path},
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Example custom server
local sumneko_root_path = vim.fn.getenv 'HOME' .. '/.local/share/nvim/lsp_servers/sumneko_lua/extension/server' -- Change to your sumneko root installation
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')


local function join_paths(...)
  local result = table.concat({ ... }, "/")
  return result
end

local function get_runtime_dir()
    return vim.fn.stdpath "config"
end

require('lspconfig').sumneko_lua.setup {
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        [join_paths(get_runtime_dir(), "lua")] = true,
        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['sumneko_lua'].setup {
--   capabilities = capabilities,
--   cmd = {"/home/franveiga/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/Linux/lua-language-server",
--         "-E",
--         "/home/franveiga/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/main.lua"},
-- }
--


-- Mappings
Map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
Map("n", "gd", ":Lspsaga preview_definition<CR>")
Map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')

-- Map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- Map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
-- Map('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
