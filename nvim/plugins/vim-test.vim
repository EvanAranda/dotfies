Plug 'vim-test/vim-test'

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>


function! ActivateVenv(cmd) abort
  return '.venv/bin/activate; '.a:cmd
endfunction

let g:test#custom_transformations = { 'activate_venv': function('ActivateVenv') }


let g:test#strategy='neovim'
let g:test#python#runner = 'pytest'
let g:test#python#transformation = 'activate_venv'
