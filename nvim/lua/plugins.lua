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
    end
    
    local utility = function()
       use {
           'nvim-treesitter/nvim-treesitter', 
           run = ':TSUpdate',
           config = require('plugins.treesitter').config
       } 
    end

    local interface = function()
        use { -- Nvim-Tree
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly', -- optional, updated every week. (see issue #1193)
            config = require('plugins.nvim-tree').config
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
