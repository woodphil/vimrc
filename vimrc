""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIMRC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"execute pathogen#infect()

set nocompatible

" need this turned off for vundle to work
" we turn it back on later
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" vundle managing vundle, makes sense
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

call vundle#end()

" filetypes
filetype plugin on
filetype indent on

set history=1000

set autoread
set wildmenu
set ruler
set cmdheight=2
set hid

"directories for backup
"set backupdir=$HOME/.vim/backup//
"set directory=$HOME/.vim/swap//
"set viewdir=$HOME/.vim/views//

" settings for colourscheme
set t_Co=256
set background=dark
colorscheme hybrid_material
let g:enable_bold_font = 1


"key functionality that makes sense
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic

set mat=2

"hybrid number
set number
set relativenumber

"visuals
syntax enable
syntax on

"cursor bar
set cursorline
set cursorcolumn

"enconding and file types
set encoding=utf8

set ffs=unix,dos,mac

"tab settings
set expandtab
set smarttab

"tab values
set shiftwidth=4
set tabstop=4
set softtabstop=4

"linebreak and wordwrap
set linebreak
set textwidth=100

"show whitespace
set list


set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"paste mode
set pastetoggle=<F3>

""""""
"status line
""""""
"always show the status line
set laststatus=2

" Format the status line
"let g:airline_powerline_fonts = 1
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map j gj
map k gk

"pair matching
set showmatch
set matchtime=2

" setting ripgrep as default search
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

" setting terminal colours
" set term=screen-256color

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

"tab movement mapping

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" showmarks plz
"let g:showmarks_enable = 1
"let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"let showmarks_ignore_type = "hqm"

"let showmarks_hlline_lower = 1
"let showmarks_hlline_upper = 0

"if &background == "light"
"    " For marks a-z
"    hi clear ShowMarksHLl
"    hi ShowMarksHLl term=bold cterm=none ctermbg=grey gui=none guibg=grey

    " For marks A-Z
"    hi clear ShowMarksHLu
"    hi ShowMarksHLu term=bold cterm=bold ctermbg=lightred ctermfg=darkred gui=bold guibg=lightred guifg=darkred
"else
" For marks a-z
"    hi clear ShowMarksHLl
"    hi ShowMarksHLl term=bold cterm=bold ctermbg=lightblue gui=bold guibg=lightblue guifg=darkblue
    "guibg=#eee8d5
" For marks A-Z
"    hi clear ShowMarksHLu
"    hi ShowMarksHLu term=bold cterm=bold ctermbg=lightred ctermfg=darkred gui=bold guibg=lightred guifg=darkred
"endif

map ,b :CtrlPBuffer

" ctrlp mapping
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

" ctrlp settings
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }
"
"VISUAL BLOCK MODE: press ctrl-v to enter and then use I to enter special insert
"""""""""
" helper functions
"""""""""
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction

func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

augroup kill_ws
    autocmd!
    autocmd BufWrite * :call DeleteTrailingWS()
augroup END

augroup filetype_tabs
    autocmd!
    autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType coffeescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType mako setlocal shiftwidth=2 tabstop=2 softtabstop=2
    autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END

" key timeouts to make things faster
set timeoutlen=1000
" time out value for key codes
set ttimeoutlen=10

