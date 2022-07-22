local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.g.mapleader = ","

-- Escape from insert mode
map("i", "jk", "<Esc>")                     

-- Reselect visual selection after indenting
map("v", "<", "<gv")                        
map("v", ">", ">gv")

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
map("v", "y", "myy`y", { noremap = true })
map("v", "Y", "myY`y", { noremap = true })

-----------------------------------------------------------
-- Editing
-----------------------------------------------------------
-- Paste replace visual selection without copying it
map("v", "<leader>p", '\"_dP')

-- Pane Splitting
map("n", "vv", "<C-w>v")
map("n", "ss", "<C-w>s")
vim.o.splitbelow = true -- when splitting horizontally, move coursor to lower pane
vim.o.splitright = true -- when splitting vertically, mnove coursor to right pane

-----------------------------------------------------------
-- Navigation
-----------------------------------------------------------

-- Edit file at path under cursor 
map("n", "gf", ":edit <cfile><cr>")                 

-- Edit & Source the init file
map("n", "<leader>ve", ":edit $MYVIMRC<cr>")         
map("n", "<leader>vs", ":source $MYVIMRC<cr>")       

-- Close buffer in pane and switch to next buffer without closing pane
map("", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>") 
map("n", "<leader>Q", ":bufdo bdelete<cr>")

-- Pane navigation
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- Tab navigation
map("n", "H", ":bprevious<cr>", { noremap = true })
map("n", "L", ":bnext<cr>", { noremap = true })

-----------------------------------------------------------
-- Nvim Tree
-----------------------------------------------------------
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file

-----------------------------------------------------------
-- Telescope
-----------------------------------------------------------
map("n", "<leader>ff", ":Telescope find_files<cr>")
map("n", "<leader>fg", ":Telescope live_grep<cr>")
map("n", "<leader>fb", ":Telescope buffers<cr>")
map("n", "<leader>fh", ":Telescope help_tags<cr>")
