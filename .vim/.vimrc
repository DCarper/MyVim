syntax on
filetype plugin indent on
colorscheme idlefingers

set nobackup
set nowritebackup
set noswapfile

set nocompatible

" Vundle stuff
filetype off
set rtp+=~/code/new_vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
call vundle#end()            " required
filetype plugin indent on    " required

" End of Vundle stuff

map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>4 :cd Sites/4momsOnline<CR>
map <silent> <LocalLeader>e :call HtmlEscape()<CR>
map <silent> <LocalLeader>c :call Align()<CR>
map <silent># :s/^/#/<CR>

:inoremap zz <Esc>

:set hidden
:set number
:set ts=2
:set sts=2
:set shiftwidth=2
syntax on
colorscheme idlefingers

map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>e :call HtmlEscape()<CR>
map <silent> <LocalLeader>c :call Align()<CR>
:inoremap zz <Esc>

:set hidden
:set number
:set ts=2
:set sts=2
:set guifont=Menlo:h11.00
:au FocusLost * :wa

if has("gui_running")
set guioptions=egmrt
endif

"let g:CommandTMaxFiles=40000
":set wildignore+=vendor/**
":set wildignore+=public/images
":set wildignore+=*.png
":set wildignore+=*.jpg
":set wildignore+=*.gif

function HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
  silent s/\'/\&apos;/eg
  silent s/\’/\&apos;/eg
	silent s/\"/\&quot;/eg
endfunction

function Align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
