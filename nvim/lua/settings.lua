vim.g.leader = ","

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
vim.opt.completeopt   = {'menu', 'menuone', 'noselect'}
vim.opt.smartcase     = true

-- Theme
vim.g.ayucolor = 'dark'
vim.cmd('colorscheme ayu')

-- Get out of INSERT mode
vim.keymap.set('i', 'jk', '<ESC>')

-- Navigate buffers
vim.keymap.set('n', 'H', ':bp<CR>')
vim.keymap.set('n', 'L', ':bn<CR>')

-- Navigate windows
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- File Tree Explorer
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
