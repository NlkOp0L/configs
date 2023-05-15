require('snippy').setup({})

local cmp = require("cmp")
local lspkind = require('lspkind')
cmp.setup({
    enabled = function()
        local context = require 'cmp.config.context'
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end,
    snippet = {
        expand = function(args)
            require("snippy").lsp_expand(args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ["<Esc>"] = cmp.mapping.abort(),
        ['<cr>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'snippy' }

    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
            mode = "symbol",
            preset = 'codicons',
            ellipsis_char = '...',
            menu = ({
                buffer = "[BUFFER]",
                nvim_lsp = "[LSP]",
                path = "[PATH]",
                cmdline = "[CMDLINE]",
                snippy = "[SNIPPY]"
            }),
            symbol_map = {
                Text = "",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = ""
            }
        })
    }
})


require("lspconfig")
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
        vim.keymap.set('n', 'ge', vim.diagnostic.open_float)
        vim.keymap.set('n', 'gl', vim.diagnostic.setloclist)
    end,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
vim.diagnostic.config({
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})


require("mason").setup({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()
vim.cmd([[
    function! s:deregister_autocmd() abort
        autocmd TextChanged <buffer> ++once autocmd! MasonWindow
    endfunction
    autocmd FileType mason wincmd L | call s:deregister_autocmd()
]])

local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.clangd.setup {
    capabilities = capabilities
}
lspconfig.lua_ls.setup {
    capabilities = capabilities
}
lspconfig.jdtls.setup {
    capabilities = capabilities
}
