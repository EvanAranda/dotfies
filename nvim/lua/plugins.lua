local bootstrap = function()
    local fn = vim.fn
    local data_path = fn.stdpath('data')
    local install_path = data_path .. '/site/pack/packer/start/packer.nvim'
    local not_installed = fn.empty(fn.glob(install_path)) > 0

    if not_installed then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        return true
    end
    return false
end

local startup = function(use)
    use 'wbthomason/packer.nvim' 

    local language = function()

        use { 
            'simrat39/rust-tools.nvim',
            requires = {
                -- Debugging
                'nvim-lua/plenary.nvim',
                'mfussenegger/nvim-dap'
            },
            -- Config inside plugins/lspconfig.lua
        }
    end
    
    local utility = function()
        use {
            'nvim-treesitter/nvim-treesitter', 
            run = ':TSUpdate',
            config = require('plugins.treesitter')
        } 

        use {
            'neovim/nvim-lspconfig',
            config = require('plugins.lspconfig')
        }

        use {
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
            },
            config = require('plugins.cmp')
        }

        use {
            "windwp/nvim-autopairs",
            config = require('plugins.autopairs')
        }
    end

    local interface = function()
        use { -- Nvim-Tree
            'nvim-tree/nvim-tree.lua',
            requires = { 'nvim-tree/nvim-web-devicons' },
            tag = 'nightly',
            config = require('plugins.nvim-tree')
        }

        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            requires = { 'nvim-lua/plenary.nvim' },
            config = require('plugins.telescope')
        }

        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = require('plugins.lualine')
        }
    end

    local themes = function()
        use 'ayu-theme/ayu-vim'
    end

    language()
    utility()
    interface()
    themes()
end

local first_install = bootstrap()
require('packer').startup(startup)

if first_install then
    print('First install. Plugins will automatically install. Restart Neovim')
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
