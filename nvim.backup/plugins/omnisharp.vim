Plug 'OmniSharp/omnisharp-vim'

augroup OmnisharpCommands
  autocmd!
  autocmd CursorHold *.cs OmniSharpTypeLookup

  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>rn <Plug>(omnisharp_rename)
  autocmd FileType cs nmap <silent> <buffer> K <Plug>(omnisharp_documentation)

  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [g <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]g <Plug>(omnisharp_navigate_down)
augroup END
