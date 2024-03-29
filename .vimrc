"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

let $vimhome = $HOME."/.vim"

" Be iMproved
set nocompatible

"=====================================================
"" Vundle settings
"=====================================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"    Plugin 'pangloss/vim-javascript'
"    Plugin 'leafgarland/typescript-vim'
"    Plugin 'peitalin/vim-jsx-typescript'
"    Plugin 'styled-components/vim-styled-components', { 'branch': 'main' }
"    Plugin 'jparise/vim-graphql'
"   Plugin 'neoclide/coc.nvim', {'branch': 'release'}

    Plugin 'VundleVim/Vundle.vim'               " let Vundle manage Vundle, required
    Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
    Plugin 'scrooloose/nerdtree'                " File system navigation
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'preservim/tagbar'
    Plugin 'jessedhillon/vim-easycomment'
    Plugin 'ervandew/supertab'
    Plugin 'neomake/neomake'
    Plugin 'w0rp/ale'
    Plugin 'fatih/vim-go'
    Plugin 'Shougo/deoplete.nvim'
"    Plugin 'davidhalter/jedi-vim'
"    Plugin 'deoplete-plugins/deoplete-jedi'
"    Plugin 'psf/black'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'tpope/vim-fugitive'
    Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plugin 'junegunn/fzf.vim'
    Plugin 'mhinz/vim-startify'

    " themes
    Plugin 'sjl/badwolf'
    Plugin 'fatih/molokai'
    Plugin 'morhetz/gruvbox'
    Plugin 'arzg/vim-colors-xcode'

    " syntax highlighting
    Plugin 'tsandall/vim-rego'
    Plugin 'vim-python/python-syntax'
    Plugin 'sheerun/vim-polyglot'

call vundle#end()                           " required

filetype on
filetype plugin on
filetype plugin indent on

" leader is comma
let mapleader=","

" Extensions setup
"
let g:coc_global_extensions = [
      \ 'coc-tsserver'
      \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" fzf
map <C-P> :Files <CR>
map <C-G> :GFiles <CR>
map <leader>b :Buffers <CR>
map <leader>f :Rg<CR>
map <leader><leader> :Commands <CR>

let g:python3_host_prog = $HOME . "/.virtualenvs/nvim/bin/python3"
let g:python_highlight_all = 1
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Easy comment
vmap <silent> <C-,> :call ToggleCommentVisual()<CR>
nmap <silent> <C-,> :call ToggleCommentLine()<CR>
au FileType python let b:comment_style="inline"
au FileType python let b:comment_opener="#"

au FileType yaml let b:comment_style="inline"
au FileType yaml let b:comment_opener="#"

au FileType vimrc let b:comment_style="inline"
au FileType vimrc let b:comment_opener='"'

au FileType go let b:comment_style="inline"
au FileType go let b:comment_opener='//'

au FileType go nnoremap <leader>d :GoDef<CR>
au FileType go nnoremap <leader>r :GoReferrers<CR>
au FileType go nnoremap <leader>n :GoRename<CR>



" DEOPLETE
let g:deoplete#enable_at_startup = 1

" Black
let g:black_linelength = 100
"let g:black_skip_string_normalization = 0
"let g:black_fast = 0

" VIM-GO
"let g:go_list_type = 'quickfix'
"let g:go_highlight_diagnostic_warnings = 0
"let g:go_highlight_diagnostic_errors = 1
"let g:go_fmt_command = 'goimports'
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
"let g:go_rename_command = 'gopls'
"let g:go_highlight_string_spellcheck = 1
"let g:go_highlight_format_strings = 1
"
let g:pymode_rope = 0

" ALE
let g:ale_enabled = 1
let g:ale_linters = {
	\ 'go': ['gofmt', 'golint', 'gopls', 'govet'],
	\}
let g:ale_fixers = {
    \'go': ['gofmt'],
    \'python': ['black'],
    \'*': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_virtualtext_cursor = 1
let g:ale_sign_column_always = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSig
highlight clear ALEWarning
highlight clear ALEError
let g:ale_set_highlights = 0
let g:ale_open_list = 0
let g:ale_go_gometalinter_executable = 'golangcli-lint'
let g:ale_sign_error = '🔴'
let g:ale_sign_warning= '🟡'
let g:ale_sign_info= '💡'
let g:ale_virtualtext_prefix = ' > '
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_pylint_options = "--max-line-length=120"
let g:ale_python_flake8_options = "--max-line-length=120"


" Jedi vim
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = "1"

" Bindings
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"


" "Vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" pasting
nnoremap p "+gp
vnoremap p "+gp

" Tagbar
nnoremap <leader>t :TagbarToggle<CR>

let g:tagbar_width=40
" autoopen tagbar for python and golang
" autocmd VimEnter *.py,*.go nested :call tagbar#autoopen(1)
let g:tagbar_sort=0

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeWinSize=35
let NERDTreeQuitOnOpen = 0
let NERDTreeAutoDeleteBuffer = 1

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Start NERDTree when Vim is started without file arguments.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

nmap " :NERDTreeToggle<CR>


" General settings

nnoremap <silent> <C-d> :lclose<CR>:bdelete!<CR>

set termguicolors

"set bg=light
let g:gruvbox_contrast_dark='hard'
"colorscheme xcodelight
colorscheme gruvbox
"colorscheme molokai

" enable syntax highlighting
syntax enable


" set shell to bash
"set shell=/bin/bash\ --rcfile\ ~/.bashrc
map <leader>c :!sync &<cr>

set hidden

" show line numbers
set number

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" number of spaces in tab when editing
set softtabstop=4
set tabstop=4

" show the matching part of the pair for [] {} and ()
set showmatch

" show command in bottom bar
set showcmd

" visual autocomplete for command menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "1000 :  will save up to 1000 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"1000,:20,%,n~/.viminfo

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" function that restores the cursor position and its autocmd so that it gets triggered
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Add a bit extra margin to the left
set foldcolumn=1

" Persistend undo between sessions
set undofile
set undodir=$vimhome/undodir

set backup
set backupdir=$vimhome/backupdir
set directory=~/.vim/tmp



"=====================================================
"" Tabs / Buffers settings
"=====================================================
" open new buffers as tabs
"tab sball
set switchbuf=useopen
set laststatus=2

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

nnoremap G :syntax sync fromstart<cr>G

set laststatus=2
set backspace=indent,eol,start
set clipboard=unnamedplus

" Highlight trailing whitespace in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" Have this highlighting not appear whilst you are typing in insert mode
" Have the highlighting of whitespace apply when you open new buffers
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Remove trailing whitespaces
function! CleanUpWs()
    %s/\s\+$//e
     |norm!``
endf

"aug CleanUp
"    au BufWritePre *.go if !&bin | call CleanUpWs() | endi
"aug END
"

" reset the backgrond color: allows to dim inactive pane in tmux
hi Normal ctermbg=none guibg=none
hi LineNr ctermbg=none guibg=none



augroup rerender_large_files
  au!
  au BufEnter *.go set redrawtime=10000 | syntax sync minlines=200 | syntax sync maxlines=500
augroup END
