Plug 'joshdick/onedark.vim', { 'as': 'onedark' }

augroup OnedarkOverrides
  autocmd User PlugLoaded ++nested colorscheme onedark
  let g:airline_theme='onedark'
augroup end
