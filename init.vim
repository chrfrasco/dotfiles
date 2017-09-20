set nocompatible

call plug#begin()
  " Completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Colorschemes
  Plug 'morhetz/gruvbox'

  " Themeing
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Elixir plugins
  Plug 'elixir-editors/vim-elixir'
  Plug 'slashmili/alchemist.vim'

call plug#end()

" General
" -------

  " Add python interpreters
  let g:python_host_prog = '/full/path/to/neovim2/bin/python'
  let g:python3_host_prog = '/full/path/to/neovim3/bin/python'

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

  " Strip trailing whitespace (,ss)
  " Credit github.com/paulirish
  function! StripWhitespace ()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction
  noremap <leader>ss :call StripWhitespace ()<CR>

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
  let g:airline_powerline_fonts = 1

" Deoplete
" --------

  " Enable at startup
  let g:deoplete#enable_at_startup = 1

  " Cycle through completions with <Tab>
  inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#mappings#manual_complete()
		function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
