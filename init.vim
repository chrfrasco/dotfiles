set nocompatible

call plug#begin()
  " Completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Colorschemes
  Plug 'morhetz/gruvbox'

  " Themeing
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

call plug#end()

" General
" -------

  " Ignore these globs in file completions
  set wildignore+=*.o,*.obj,*.pyc,*.so,*.swp,*.zip,*.jpg,*.gif,*.png,*.pdf
  set wildignore+=.git,.hg,.svn,DS_STORE,bower_components,node_modules

  " Tabbing
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab

  " Set leader key
  let mapleader = ","
  let maplocalleader = ","

  " Open init.vim in new split and reload
  nmap <leader>v :vsplit $MYVIMRC<cr>
  nmap <leader>r :source $MYVIMRC<cr>

  " Colorschemes
  set background=dark
  colorscheme gruvbox
  let g:airline_theme = 'gruvbox'

  " Disable arrow keys
  inoremap <up> <nop>
  inoremap <down> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>

" Airline
" -------

  " Enable patched fonts
  " TODO

" Deoplete
" --------

  " Enable at startup
  let g:deoplete#enable_at_startup = 1
