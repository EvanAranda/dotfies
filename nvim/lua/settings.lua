vim.g.mapleader = ","

-- Indents
local tabsize       = 4
vim.opt.smarttab    = true
vim.opt.expandtab   = true
vim.opt.smartindent = true
vim.opt.shiftwidth  = tabsize
vim.opt.tabstop     = tabsize
vim.opt.softtabstop = tabsize

-- Folding
vim.o.foldmethod  = 'expr'
vim.o.foldexpr    = 'nvim_treesitter#foldexpr()'

-- Misc
vim.opt.number        = true
vim.opt.cursorline    = true
vim.opt.ruler         = true
vim.opt.showcmd       = true
vim.opt.termguicolors = true
-- vim.opt.completeopt   = {'menu', 'menuone', 'noselect'}
vim.opt.completeopt   = {'menuone', 'noinsert', 'noselect'}
vim.opt.smartcase     = true
vim.opt.ignorecase    = true
vim.opt.splitright    = true
vim.opt.splitbelow    = true
vim.opt.scrolloff     = 8
vim.opt.sidescrolloff = 8

-- Memory
vim.opt.hidden        = true
vim.opt.history       = 100
vim.opt.lazyredraw    = true
vim.opt.updatetime    = 300
vim.opt.redrawtime    = 10000

-- Theme
vim.g.ayucolor = 'dark'
vim.cmd('colorscheme ayu')

-- Get out of INSERT mode
vim.keymap.set('i', 'jk', '<ESC>', { noremap = true })
vim.keymap.set('n', '<Leader>ve', ':e $MYVIMRC<CR>')
vim.keymap.set('n', '<Leader>vs', ':source $MYVIMRC<CR>')

-- Splitting
vim.keymap.set('n', 'vv', ':vsplit<CR>')
vim.keymap.set('n', 'ss', ':split<CR>')

-- Navigate buffers
vim.keymap.set('n', 'H', ':bp<CR>')
vim.keymap.set('n', 'L', ':bn<CR>')

-- Navigate windows
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- Closing buffers
vim.keymap.set('n', '<Leader>q', ':bp<Bar>sp<Bar>bn<Bar>bd<CR>', { noremap = true, silent = true }) 
vim.keymap.set('n', '<Leader>Q', ':bufdo bdelete<CR>', { noremap = true, silent = true })
