" Wyłącza kompatybilność z vi
set nocompatible
" Enable plugins via pathogen

"execute pathogen#infect()
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tcomment_vim'
Plugin 'Shougo/unite.vim'
"Plugin 'bling/vim-airline/'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-syntastic/syntastic'
"Plugin 'w0rp/ale'
Plugin 'nvie/vim-flake8'
Plugin 'maralla/completor.vim'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'andymass/vim-matchup'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" Call :PluginInstall after adding new plugins

" Colorscheme
if &t_Co >= 256 || has("gui_running")
	" Try gruvbox, fall back to evening
	try
		colorscheme gruvbox
	catch
		colorscheme evening
	endtry

    if exists('+colorcolumn')
        set colorcolumn=72
    endif
else
	" Colorschemes for 16 color terminal, those are least ugly
	colorscheme slate
"	colorscheme torte
endif

set backspace=indent,eol,start

" system dependent settings: fonts etc
if has("win32")
	set gfn=Consolas:h10:cANSI
	let $LANG = 'en'
	set langmenu=none

	if has("multi_byte")
		if &termencoding == ""
			let &termencoding = &encoding
		endif
		set encoding=utf-8                     " better default than latin1
		setglobal fileencoding=utf-8           " change default file encoding when writing new files
	endif
else
    set gfn=Monospace\ 9
endif


" Enable mouse
set mouse=nv
"set ttyfast " May be required
set ttymouse=xterm2

" Domyślnie włącz podświetlanie składni
syntax on

" Włącz podświetlanie wyników wyszukiwania i interaktywne wyszukiwanie
set hlsearch
set incsearch

" Włącz numerowanie wierszy
set nu

" Włącz automatyczne tworzenie wcięć w kodzie
set ai
set smartindent

" Wcięcia w stylu C - nie tylko dla C
au FileType c,cpp,cs,java,javascript,php,perl set cin

" Ustaw szerokość tabulacji na 4 spacje
set tabstop=4
set shiftwidth=4
"set noexpandtab
set expandtab

" Ustawienia zawijania tekstu
set nowrap            " Wyłącz zawijanie
set linebreak         " Kiedy zawijanie jest włączone, nie dziel słów w połowie
set display+=lastline " Wyświetlaj niekompletne wiersze przy włączonym zawijaniu

" Klawisze 'góra' i 'dół' działają tak jak w 'normalnym' edytorze przy
" zawiniętych wierszach - przemieszczają kursor według wierszy widocznych
" na ekranie, nie zaś zapisanych fizycznie w pliku. Klawisze h, j, k, l
" działają jak dawniej
map <up> gk
imap <up> <C-o>gk
map <down> gj
imap <down> <C-o>gj

" Włącz sprawdzanie pisowni i ustaw język na polski
"set spell
set spelllang=pl,en

" Włącz menu kontekstowe
set mousemodel=popup

" Zwijanie kodu według składni edytowanego pliku
set foldmethod=syntax
set foldlevel=1024

" Uzupełnianie składni
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Ustawienia wtyczki grep
let Grep_Skip_Dirs='RCS CVS SCCS .svn .git'

" Więcej skrótów klawiaturowych
nnoremap <silent> <F5> :w <bar> :!%:p<CR>
autocmd FileType python map <buffer> <F6> :call Flake8()<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <F3> :Bgrep
nnoremap <silent> <S-F3> :Grep 

" Używa CSS w wyeksportowanych plikach HTML
let g:html_use_css="1"

set tabpagemax=24

hi ColorColumn guibg=#2f2f2f

set wildmenu        " Use wildmenu
set wildmode=longest:list:full

autocmd FileType javascript,lisp,scheme,perl,python,ruby,vim setlocal formatoptions-=cro

" Hide those ugly ^M
match Ignore /\r$/

" Konfiguracja dla poszczególnych hostów
if hostname() == "ps5104"
endif

set cursorline

set background=dark

let g:rainbow_active = 1
let g:rainbow_operators = 1

set splitright
set splitbelow

" Ignore files in NERDTree and CtrlP
set wildignore+=*.pyc
let NERDTreeIgnore = ['\.pyc$']
let g:ctrlp_custom_ignore = 'pyc$'


let g:ackprg = "/home/sitek/perl5/bin/ack"
let g:ack_default_options = " --ignore-file=is:tags"

" Foo {{{
" bar
" }}}
" vim: foldmethod=marker foldlevel=0
