-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Pre save actions
    vim.api.nvim_create_autocmd('BufPreWrite', {
        callback = function(args) 
            -- Format on save
            vim.lsp.buf.formatting_sync()
        end
    })

    -- vim.cmd([[
    --     autocmd BufPreWrite <buffer> lua vim.lsp.buf.formatting_sync()
    -- ]])

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD',        vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd',        vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K',         vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi',        vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>',     vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)
    vim.keymap.set('n', '<space>D',  vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr',        vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f',  function() vim.lsp.buf.format { async = true } end, bufopts)
end

local make_lsp_setup = function()
    local lsp = require('lspconfig')

    local capabilities = vim.lsp.protocol.make_client_capabilities() 
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
    }

    local default_opts = {
        on_attach = on_attach,
        flags = lsp_flags
    }

    return function(config_name, opts)
        opts = opts or {}
        opts = vim.tbl_extend('force', default_opts, opts)
        lsp[config_name].setup(opts)
        print("setup lsp completed - " .. config_name)
    end
end

return function()
    -- local lsp_util = require('lspconfig.util')
    local lsp = require('lspconfig')

    local capabilities = vim.lsp.protocol.make_client_capabilities() 
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
    }

    local default_opts = {
        on_attach = on_attach,
        flags = lsp_flags,
        root_dir = function() vim.fn.getcwd() end
    }

    local setup = function(config_name, opts)
        opts = opts or {}
        opts = vim.tbl_extend('force', default_opts, opts)
        lsp[config_name].setup(opts)
    end

    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d',       vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d',       vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Settings
    vim.diagnostic.config { virtual_text = true }

    -- Servers
    setup('pyright')
    setup('rust_analyzer')
end
