set laststatus=2
au VimEnter * NERDTree
syntax on
set number
"Changing jk to esc
inoremap jk <ESC>

filetype off
filetype plugin on
filetype indent on

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

"vundle
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()

Plugin 'valloric/youcompleteme'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'cohlin/vim-colorschemes'
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

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='darcula'

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

if exists('b:mapped_auto_closetag') || &cp | finish | endif
let b:mapped_auto_closetag = 1

ino <buffer> <silent> < <><left>
ino <buffer> <silent> > <c-r>=<SID>CloseTag()<cr>
ino <buffer> <expr> <cr> <SID>Return()

if exists('s:did_auto_closetag') | finish | endif
let s:did_auto_closetag = 1

" Gets the current HTML tag by the cursor.
fun s:GetCurrentTag()
	return matchstr(matchstr(getline('.'),
						\ '<\zs\(\w\|=\| \|''\|"\)*>\%'.col('.').'c'), '^\a*')
endf

" Cleanly return after autocompleting an html/xml tag.
fun s:Return()
	let tag = s:GetCurrentTag()
	return tag != '' && match(getline('.'), '</'.tag.'>') > -1 ?
				\ "\<cr>\<cr>\<up>" : "\<cr>"
endf

fun s:InComment()
	return stridx(synIDattr(synID(line('.'), col('.')-1, 0), 'name'), 'omment') != -1
endf

" Counts occurance of needle in page, when not in a comment.
fun s:CountInPage(needle)
	let pos = [line('.'), col('.')]
	call cursor(1, 1)
	let counter = search(a:needle, 'Wc')
	while search(a:needle, 'W')
		if !s:InComment() | let counter += 1 | endif
	endw
	call cursor(pos)
	return counter
endf

" Returns whether a closing tag has already been inserted.
fun s:ClosingTag(tag)
	return s:CountInPage('\c<'.a:tag.'.\{-}>') <= s:CountInPage('\c</'.a:tag.'>')
endf

" Automatically inserts closing tag after starting tag is typed
fun s:CloseTag()
	let line = getline('.')
	let col = col('.')
	if line[col-1] != '>' | return '>' | endif
	let col += 1
	call cursor(0, col)
	" Don't autocomplete next to a word or another tag or if inside comment
	if line[col] !~ '\w\|<\|>' && !s:InComment()
		let tag = s:GetCurrentTag()
		" Insert closing tag if tag is not self-closing and has not already
		" been closed
		if tag != '' && tag !~ '\vimg|input|link|meta|br|hr|area|base|param|dd|dt'
					\ && !s:ClosingTag(tag)
			let line = substitute(line, '\%'.col.'c', '</'.escape(tag, '/').'>', '')
			call setline('.', line)
			call cursor(0, col)
		endif
	endif
	return ''
endf

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
