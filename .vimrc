"syntax highlighting on
syntax on
"show line numbers
set number

"vim detect file types and load subsequent file types
filetype on
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
Plugin 'Shutnik/jsh/int2.vim'        
Plugin 'mattn/emmet-vim'            
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less'        
Plugin 'skammer/vim-css-color'      
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'digitaltoad/vim-jade'
"end plugin definition
call vundle#end() 


set colorcolumn=80

"colorscheme distinguished
set t_Co=256
"Plugin 'Raimondi/delimitMate'