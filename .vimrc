" Configuration file for vim
" Set variables specific to a file
" The modelines variable sets the number of lines (at the beginning and end of each file) vim checks for initializations.
set modelines=1

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
filetype off " Vundle required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('some/path/to/install')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" airline, heard of it
"Plugin 'vim-airline/vim-airline'

" YouCompleteMe, as real as the name
Plugin 'Valloric/YouCompleteMe'

call vundle#end()          " required
filetype plugin indent on  " required
" to ignore indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate 
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" 
" see :h vundle for more details or wiki for FAQ
" put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""
" In bash_profile enter the same things and use  "
" the default colorscheme.                       "
" export CLICOLOR=1                              "
" export LSCOLORS=GxFxCxDxBxegedabagaced         "
""""""""""""""""""""""""""""""""""""""""""""""""""

" deletion of the .netrwhist file
au VimLeave * if filereadable("/Users/hacker/.vim/.netrwhist") | call delete("/Users/hacker/.vim/.netrwhist") | endif 

" for some purpose I need to cancel the spell opt
"set spell

" I do not know what is this line resulted in
"set backspace=2		" more powerful backspacing

" colorscheme
hi Comment ctermfg=grey guifg=#808080

" set key map
nmap q: :q

" Below is functional customize area
set showmode
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set ruler
set number
set showcmd
set textwidth=79
set fileformat=unix
syntax on

hi Comment ctermfg=grey guifg=#808080
