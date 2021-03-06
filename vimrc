"""""""""""""""""""""""""""""""""""" 
" NeoBundle setup                  "
"""""""""""""""""""""""""""""""""""" 
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
endif

" My Bundles here:
NeoBundle 'Lokaltog/vim-easymotion'
" NeoBundle 'Shougo/neocomplete'
" NeoBundle 'Shougo/neomru.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}
" NeoBundle 'Shougo/vimshell.vim'
" NeoBundle 'Shougo/wildfire.vim'
" NeoBundle 'Valloric/YouCompleteMe', {'build': {'unix': './install.sh --clang-completer'}}
NeoBundle 'ddollar/nerdcommenter'
NeoBundle 'flazz/vim-colorschemes'
" NeoBundle 'freitass/todo.txt-vim'
NeoBundle 'godlygeek/tabular'
" NeoBundle 'kien/ctrlp.vim'
" NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'terryma/vim-multiple-cursors'
" NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"""""""""""""""""""""""""""""""""""" 
" Standard options                 "
"""""""""""""""""""""""""""""""""""" 

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
	finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		      " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		  " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

if has("autocmd")
	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		autocmd BufReadPost *
					\ if line("'\"") > 0 && line("'\"") <= line("$") |
					\   exe "normal g`\"" |
					\ endif

	augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


"""""""""""""""""""""
" Personal settings "
"""""""""""""""""""""

set undofile                " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

let mapleader = ","

" Appearance
syntax on
set hlsearch
if has("gui_macvim")
  set guifont=Menlo:h12
endif

" Colorscheme
" set background=dark
" let g:solarized_termtrans=0 " Required by iTerm2
colorscheme jellybeans

set nobackup              " Disable the creation of backup files (the ones ending with ~)
set mouse=a               " enable mouse 'all'
set number                " line numbers
set scrolloff=4           " Keep the cursor away from top/bottom
set wildmode=longest,list " TAB completion (such as bash)
set laststatus=2          " Always show a status bar
set smartcase             " Ignore case when search pattern is all lowercase
set shiftwidth=2          " # of spaces of auto indent
set softtabstop=2         " # of spaces of <TAB> key
set tabstop=2             " # of spaces erased when deleting a <TAB>
set expandtab             " Insert spaces instead of tabs
set smarttab              " 'siftwidth' in front of a line

" CtrlP
" Window configurations:
" 	position:bottom
" 	order (of results):top to bottom (ttb)
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = ''  " working path won't change when opening new files
let g:ctrlp_switch_buffer = 'Et'    " jump to opened window (if any)


" NERDCommenter
" Map <C-/> to toggle comment both in normal and visual mode
" nmap  <plug>NERDCommenterToggle
" vmap  <plug>NERDCommenterToggle

" Tabularize
nmap <silent> <leader>a= :<C-u>Tabularize /=<CR>
vmap <silent> <leader>a= :<C-u>Tabularize /=<CR>
nmap <silent> <leader>a: :<C-u>Tabularize /:<CR>
vmap <silent> <leader>a: :<C-u>Tabularize /:<CR>
nmap <silent> <leader>a:: :<C-u>Tabularize /:\zs<CR>
vmap <silent> <leader>a:: :<C-u>Tabularize /:\zs<CR>
nmap <silent> <leader>a, :<C-u>Tabularize /,<CR>
vmap <silent> <leader>a, :<C-u>Tabularize /,<CR>


""""""""""""""""
" key mappings "
""""""""""""""""
" Warning: <F1> is mapped to display help

" Clear search highlighting
nnoremap <silent> <F2> :nohlsearch<CR>

" Edit-compile-edit cycle shortcuts
nnoremap <F3> :make<CR>
nnoremap <F4> :make run<CR>
nnoremap <F5> :make clean<CR>
nnoremap <F6> :make ctags<CR>
nnoremap <F7> :cp<CR>
nnoremap <F8> :cn<CR>

" NERDTree
nnoremap <silent> <F8> :NERDTreeToggle<CR>
nnoremap <silent> <F9> :TagbarToggle<CR>

" Tagbar
let g:tagbar_sort      = 0  " Display tags the same order they appear in the source file
let g:tagbar_width     = 30 " Set Tagbar window width to 30
let g:tagbar_autofocus = 1  " Change the focus to the Tagbar window whenever it is opened
nnoremap <silent> <F10> :TagbarToggle<CR>

" Move between windows using ctrl-[hjkl]
nnoremap <silent> <C-K> <C-W>k
nnoremap <silent> <C-J> <C-W>j
nnoremap <silent> <C-H> <C-W>h
nnoremap <silent> <C-L> <C-W>l

""""""""""""""""""""""""
" Macbook alternatives "
""""""""""""""""""""""""
" These are command mapping used as an alternative for when the function keys
" are not available (i.e. on the macbook)
nnoremap <silent> <leader>q :nohlsearch<CR>
nnoremap <silent> <leader>a :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :TagbarToggle<CR>
nnoremap <silent> <leader>s :Gstatus<CR>

