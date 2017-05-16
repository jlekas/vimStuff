set laststatus=2
"au VimEnter * NERDTree
syntax on
"shows numbers on side
set number
"Changing jk to esc
inoremap jk <ESC>

filetype off
filetype plugin on
filetype indent on

"if you want to stop text wrap at 80 char
"set textwidth=0 wrapmargin=0
set autoread

set encoding=utf-8
set fileencoding=utf-8

"deleting fixing
set backspace=indent,eol,start

"indentation
set expandtab
set autoindent
set smartindent
set shiftwidth=2
set softtabstop=2
set smarttab

"set 80 cols
set textwidth=80

"fix the copy paste issue in vim

"vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()

Plugin 'godlygeek/tabular'
Plugin 'NLKNguyen/copy-cut-paste.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-scripts/L9'
Plugin 'itchyny/lightline.vim'      
Plugin 'tpope/vim-surround'         
" -- Web Development
Plugin 'mattn/emmet-vim'            
Plugin 'vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less'        
Plugin 'skammer/vim-css-color'      
Plugin 'derekwyatt/vim-scala'
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'digitaltoad/vim-jade'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
"end plugin definition
call vundle#end() 

set ts=2 sw=2 et
let g:indent_guide_start_level=2

"colorscheme distinguished
set t_Co=256

"change colorscheme
colorscheme candyman

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='wombat'

"NerdTree
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction

set colorcolumn=80

"Plugin 'Raimondi/delimitMate'
"set guifont=Sauce\ Code\ Powerline:h14
"" Make the background easier to see in Gui Vim
if has("gui_running")
  highlight Pmenu guibg=#aaaaaa guifg=#333333 gui=bold
endif


set autoindent
set noesckeys " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeout " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeoutlen=1 " (Hopefully) removes the delay when hitting esc in insert mode
set wildmenu " visually autocomplete the command menu
set lazyredraw " only redraw when needed
set ttyfast " sends more characters to the screen for fast terminal connections
set showmatch " highlight matching [{()}]
set foldenable " enable folding
set noswapfile


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
