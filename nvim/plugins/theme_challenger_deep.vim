Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

augroup ChallengerOverrides
  autocmd User PlugLoaded ++nested colorscheme challenger_deep
augroup end
