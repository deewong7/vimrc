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


" NERDTree, nice filesystem manager
Plugin 'scrooloose/nerdtree'
" toggle NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" go to the previous (last accessed) window
autocmd vimenter * wincmd p

" toggle NERDTree automatically when vim starts up without specific file(s)
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree auto quit when it is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" cmap for NERDTreeToggle
" it might not be apropriate for the those commands starts with 'n'
"cmap nd NERDTree
" nmap for NERDTreeToggle
"nmap <leader>file :NERDTreeToggle<cr>
" clearly the line below is the most comfortable part
nmap <bar> :NERDTreeToggle<cr>

" NERDTree configuration
let g:NERDTreeWinSize = 28
let g:NERDTreeWinPos = 'right'

" NERDTree colorscheme
hi Directory term=bold ctermfg=14 guifg=Cyan

" NERDcommenter, not that bad, kuh-huh?
Plugin 'scrooloose/nerdcommenter'

" if set to 0, none of the default mappings will be created
let g:NERDCreateDefaultMappings = 0
" use the first-time way to comment/decomment
"map <D-kDivide> <Plug>NERDCommenterToggle
map <leader>cc <plug>NERDCommenterComment
map <leader>cA <plug>NERDCommenterAppend
map <leader>uc <plug>NERDCommenterUncomment

" add space spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" enable trimming trailing whitespaces when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" allows us to be much quicker to traversing our pages
Plugin 'easymotion/vim-easymotion'

" set this option to 0
" if you want to disable the default mappings
" and customize your key-mappings yourself
let g:EasyMotion_do_mapping = 0

" you can know it from its name
let g:EasyMotion_disable_two_key_combo = 1

" change the default leader key of easymotion
" also, you can do this by customize easymotion keys
" map your_key <Plug>(easymotion-the_key_you_want_to_replace)
map <leader> <Plug>(easymotion-prefix)

" customize key-mappings myself
nmap <leader>f <Plug>(easymotion-f)
nmap <leader>F <Plug>(easymotion-F)
nmap <leader>w <Plug>(easymotion-w)
nmap <leader>W <Plug>(easymotion-W)
nmap <leader>b <Plug>(easymotion-b)
nmap <leader>B <Plug>(easymotion-B)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)


" airline, heard of it
Plugin 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#branch#enabled = 1
" no need for that now
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#whitespace#symbol = '!'
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>

" YouCompleteMe, as real as the name
Plugin 'Valloric/YouCompleteMe'
" set global ycm configuration files
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_filetype_blacklist = {
      \ 'foo' : 1,
      \ 'bar' : 1,
      \}
let g:ycm_key_invoke_completion = '<C-b>'
" completion start with {num} words
"let g:ycm_min_num_identifier_candidate_chars = 1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc = 0
" use <cr> to selct one item
inoremap <expr> <CR>        pumvisible() ? "\<C-y>" : "\<CR>"
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_key_list_stop_completion = ['<CR>']
" don't preview the GoToDefinitionElseDeclaration part auto
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_cache_omnifunc = 0
nnoremap <leader>go<cr> :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_server_python_interpreter='python3'

" may be the best git wrapper all the time
Plugin 'tpope/vim-fugitive'

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
"au VimLeave * if filereadable("/Users/hacker/.vim/.netrwhist") | call delete("/Users/hacker/.vim/.netrwhist") | endif 

" for some purpose I need to cancel the spell opt
"set spell

" I do not know what is this line resulted in
" more powerful backspacing
set backspace=indent,eol,start


" set key mapping
nmap q: :q

" set leader mapping
nmap ; <Leader>
let g:mapleader = ";"

" set little trick autocomplete
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i

" Below is functional customize area
set showmode
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set ruler
set number
set noshowcmd
set foldenable
" it will automatically wrap if line length is less than the number
"set textwidth=79
set fileformat=unix
let python_highlight_all=1
"set nowrap
syntax on

" colorscheme
hi Comment ctermfg=grey guifg=#808080

" nerdtree vertical styles
"set fillchars=vert:\|
set fillchars=vert:\ 
hi VertSplit ctermfg=grey ctermbg=black

" wincmd for navigate between splits
noremap <c-h> :wincmd h<cr>
noremap <c-j> :wincmd j<cr>
noremap <c-k> :wincmd k<cr>
noremap <c-l> :wincmd l<cr>
noremap <c-r> :wincmd r<cr>

" run python3 codes
nnoremap <leader>run<cr> :set splitbelow<cr>:terminal python3 %<cr>

" vim delete all buffers with NERDTree toggled
noremap <leader>x :bp<cr>:bd #<cr>

" no matter what, the <D> comand just don't work
