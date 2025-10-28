vim.o.number = true
vim.o.relativenumber = true


require("config.lazy")

require("lazy").setup("plugins")

require("mason").setup()

require('telescope').setup()

local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["snip#anonymous"](args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'markdown' },
    auto_install = true,
    highlight = {
        enable = true,
    }
})



local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config['luals'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            }
        }
    }
}

vim.lsp.enable("luals")

-- vim.treesitter.start()

-- vim.lsp.enable('lua-language-server.cmd')

-- require('lspconfig')['lua-language-server'].setup({
-- capabilities = capabilities
-- })
