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
        use { -- Rust
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
            config = function() require('plugins.treesitter') end
        } 

        use { -- LSP
            'neovim/nvim-lspconfig',
            config = function() require('plugins.lspconfig') end
        }

        use { -- Completion
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                -- snippets
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip'
            },
            config = function() require('plugins.cmp') end
        }

        use {
            "windwp/nvim-autopairs",
            config = function() require('plugins.autopairs') end
        }

        use { -- Commenting
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end
        }
    end

    local interface = function()
        use { -- File Explorer
            'nvim-tree/nvim-tree.lua',
            requires = { 'nvim-tree/nvim-web-devicons' },
            tag = 'nightly',
            config = function() require('plugins.nvim-tree') end
        }

        use { -- Popup search
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function() require('plugins.telescope') end
        }

        use { -- Status line
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function() require('plugins.lualine') end
        }
    end

    local themes = function()
        use 'ayu-theme/ayu-vim'
        use "EdenEast/nightfox.nvim"
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
