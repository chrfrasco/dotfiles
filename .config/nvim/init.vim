set nocompatible

call plug#begin()
  " Tim Pope stuff
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'

  " Completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  " Colorschemes
  Plug 'morhetz/gruvbox'
  Plug 'chrfrasco/vim-github-colorscheme'
  Plug 'NLKNguyen/papercolor-theme'

  " Themeing
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Elixir plugins
  Plug 'elixir-editors/vim-elixir'
  Plug 'slashmili/alchemist.vim'

  " Go plugins
  Plug 'fatih/vim-go'

  " Pandoc syntax
  Plug 'vim-pandoc/vim-pandoc-syntax'

  " FZF
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " GOYO
  Plug 'junegunn/goyo.vim'

  " JSX
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'

  " coffeescript
  Plug 'kchmck/vim-coffee-script'

  " updated css syntax
  Plug 'hail2u/vim-css3-syntax'

  " fish shell
  Plug 'dag/vim-fish'

call plug#end()

" General
" -------

  " Split settings
  set splitright

  nnoremap <C-H> <C-W><C-H>
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>

  " No line wrap
  set nowrap

  " Disable Ex mode
  nmap Q <nop>

  " Search settings
  set path+=**
  set wildmenu
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

  " Turn of highlighting for search results
  nmap <leader>nn :noh<cr>

  " Open init.vim in new split and reload
  let vimrc = "~/dotfiles/.config/nvim/init.vim"
  nmap <leader>cc :exec "edit " . vimrc<cr>
  nmap <leader>cv :exec "evsplit" . vimrc<cr>
  nmap <leader>ch :exec "split" . vimrc<cr>

  " Install plugins
  nmap <leader>pi :PlugInstall<cr>

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
  set background=light
  colorscheme PaperColor
  let g:airline_theme = 'sol'

  " Disable arrow keys
  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>

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

" Pandoc
" ------

  " Enable syntax for all md files
  augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
  augroup END

" vim-jsx
" =======

  " don't need .jsx extension
  let g:jsx_ext_required = 0

" FZF
" ===

  nmap ; :Buffers<CR>
  nmap <C-p> :Files<CR>
