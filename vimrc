"""""""""""""""""""""""""""""""""""" 
" Pathogen setup                   "
"""""""""""""""""""""""""""""""""""" 

" Turning filetype detection off is needed on some linux distros.
filetype off 

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


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

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
 
" Latex file encoding
autocmd FileType plaintex setlocal fileencoding=utf8

" Appearance
syntax on
set hlsearch
if has("gui_macvim")
  set guifont=Menlo:h12
endif

" Colorscheme
set background=dark
let g:solarized_termtrans=0 " Required by iTerm2
colorscheme elflord

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
nnoremap <silent> <F9> :NERDTreeToggle<CR>

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

