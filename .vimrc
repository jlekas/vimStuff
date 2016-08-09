"syntax highlighting on
syntax on
"show line numbers
set number

"vim detect file types and load subsequent file types
filetype off
filetype plugin on
filetype indent on

"reload files changed out of vim
set autoread

"utf 8 is encoding
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

"vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
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
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
"end plugin definition
call vundle#end() 

let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'
let g:lightline = {
      \ 'colorscheme': 'landscape',
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

"colorscheme distinguished
set t_Co=256
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

