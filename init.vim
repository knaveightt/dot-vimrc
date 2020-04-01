" My nvim configuration
" Based on notes from jez/vim-as-an-ide
" Check out his repository for a vim config walkthrough!

" Unlock the power
set nocompatible

" *** Vundle Plugin Manager Setup ***
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim " run time path
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" *Vim Face lift
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'

" *NERDTree Implementation
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" *Unicode Browser
Plugin 'chrisbra/unicode.vim'

" *Tags Implementation
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'

" *Git Implementation
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" *man pages / tmux
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()
filetype plugin indent on

" --- The Basics ---
set ruler
set number
set showcmd
set showmode
set hidden
set scrolloff=3
set encoding=utf-8
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
syntax on
set mouse=a
let mapleader = ","
hi clear SignColumn " for syntastic
set visualbell

" --- Searching ---
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" --- Whitespace ---
set nowrap
set tw=0
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" *** --- Plugin Specific Settings --- ***

" ------- altercation/vim-colors-solarized settings -------
set background=dark
"let g:solarized_termcolors=256 " only if terminal lacking solarized
colorscheme solarized
" colorscheme slate
" colorscheme darkblue

" ------- bling/vim-airline settings -------
" always show status bar
set laststatus=2
" for fancy arrows
" requires patched font (from gihub) - Menlo for Powerline
let g:airline_powerline_fonts=1
" show PASTE if in paste mode
let g:airline_detect_paste=1
" show airline tabs
let g:airline#extensions#tabline#enabled=1
" solarized theme for airline
let g:airline_theme='solarized'

" ------- jistr/vim-nerdtree-tabs -------
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeWinPos = "right"
" alternative settings to use builtin netrw
"let g:netrw_liststyle = 3
"let g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 20
"let g:netrw_altv = 1
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore!
"augroup END

" ------- scrooloose/syntastic settings -------
let g:syntastic_error_symbol = "☓"
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType text let b:syntastic_mode = "passive"
augroup END

" ------- xolox/vim-easytags settings -------
" Where to look for tags
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytage_supress_ctags_warning = 1

" ------- majutsuhi/tagbar settings -------
"  set tagbar on the left and size it
let g:tagbar_left = 1
let g:tagbar_width = 30
" Open/close tagbar with <leader>c
nmap <silent> <leader>c :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ------- airblade/vim-gitgutter settings -------
" In vim-airline, only display "hunks" if the diff is non-zero
" Ensure usage of ssh keys when pushing to remote repositories
let g:airline#extensions#hunks#non_zero_only = 1
" Mapping to quick git push
nnoremap <leader>p :Git --paginate push<CR>

" ------- Raimondi/delimitMate settings -------
let delimitMate_expand_cr = 1
augroup myDelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ------- jez/vim-superman settings -------
noremap K :SuperMan <cword><CR>

" *** *** END PLUGIN SETTINGS *** ***


" --- GUI Options
" Toggle Toolbars / Scrollbars
" set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
" set guioptions-=L  "remove left-hand scroll bar
" Set Font for GVim
set guifont="Lucida Console 10"


" --- Key Mapping Modifications
" >> keys mapped in above config:
" >> <leader>t, <leader>c, <leader>p, 'K'
" map command to Visualize tabs and newlines
set listchars=tab:⇒\ ,eol:□
nmap <leader>l :set list!<CR> " Toggle tabs and EOL
" nmap command to close a current buffer but keep the split
nmap <leader>d :b#<bar>bd#<CR>
" nmap command to switch the active buffer to bNext but keep the split
nmap <leader>b :bNext<CR>
" nmap command to switch the active buffer to bPrevious but keep the split
nmap <leader>v :bprevious<CR>
" nmap command to automatically open the config file for nvim
nmap <leader>e :e ~/.config/nvim/init.vim<CR>
" Move up/down editor lines
nnoremap gj <C-d> 
nnoremap gk <C-u>

