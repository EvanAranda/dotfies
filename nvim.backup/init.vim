"----------------------------------------------------------------
" General Settings
"----------------------------------------------------------------

set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set relativenumber
set number
set termguicolors
set undofile 
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set confirm
set updatetime=300
set redrawtime=10000

"----------------------------------------------------------------
" Key Maps
"----------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vs :source ~/.config/nvim/init.vim<cr>

nmap <leader>Q :bufdo bdelete<cr>

" close buffer in pane and switch to next buffer without closing pane.
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR> 

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Quicker switching between windows
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

imap jk <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

" Tab navigation
nnoremap H :bprevious<cr>
nnoremap L :bnext<cr>

"----------------------------------------------------------------
" Plugins
"----------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/airline.vim

source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/svelte.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/omnisharp.vim

source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/dispatch.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/vim-test.vim

" source ~/.config/nvim/plugins/theme_challenger_deep.vim
" source ~/.config/nvim/plugins/theme_github_dark.vim
source ~/.config/nvim/plugins/theme_onedark.vim

call plug#end()
doautocmd User PlugLoaded

"----------------------------------------------------------------
" Misc
"----------------------------------------------------------------
