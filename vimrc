" Wyłącza kompatybilność z vi
set nocompatible

" Schemat kolorów - osobno dla GUI i konsoli
if has("gui_running")
	colorscheme evening
else
	colorscheme desert
endif

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
au FileType c,cpp,cs,java,javascript,php set cin

" Ustaw szerokość tabulacji na 4 spacje
set tabstop=4
set shiftwidth=4
set noexpandtab

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
set spell
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
nnoremap <silent> <F8> :TlistToggle
nnoremap <silent> <F3> :Bgrep
nnoremap <silent> <S-F3> :Grep 

" Używa CSS w wyeksportowanych plikach HTML
let g:html_use_css="1"

set tabpagemax=24
