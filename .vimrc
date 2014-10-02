set nocompatible               " be iMproved
set modeline

" vundle conf {{{

filetype off                   " required by vundle!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" }}}

" bundles {{{

" required it's vundle!
Bundle 'gmarik/vundle'

" Games
Bundle 'TeTrIs.vim'
Bundle 'sokoban.vim'

" My Bundles here:
Bundle 'davidhalter/jedi-vim'
" don't forget to rename jpythonfold.vim to python.vim
Bundle 'jpythonfold.vim'
Bundle 'scrooloose/syntastic'
" Bundle 'scrooloose/nerdtree'
Bundle 'sjbach/lusty'
Bundle 'mbbill/undotree'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'groenewege/vim-less'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-markdown'
Bundle 'sophacles/vim-bundle-mako'
Bundle 'vim-scripts/django.vim'
Bundle 'ajford/vimkivy'
Bundle 'ervandew/supertab'
Bundle 'c.vim'
Bundle 'lilydjwg/colorizer'
Bundle 'sudar/vim-arduino-syntax'
Bundle 'kunstmusik/csound-vim'
Bundle 'mileszs/ack.vim'
" snippet
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"

filetype plugin indent on     " required by vundle!

" }}}

" color and syntax {{{

" colors and syntax
syntax on
set t_Co=256
set wrap " show long lines on many lines
set title " update term title
set hidden

" fold text {{{
if has("folding")
    set foldtext=MyFoldText()
    function! MyFoldText()
        " for now, just don't try if version isn't 7 or higher
        if v:version < 701
            return foldtext()
        endif
        " clear fold from fillchars to set it up the way we want later
        let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
        let l:numwidth = (v:version < 701 ? 8 : &numberwidth)
        if &fdm=='diff'
            let l:linetext=''
            let l:foldtext='---------- '.(v:foldend-v:foldstart+1).' lines the same ----------'
            let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
            let l:align = (l:align / 2) + (strlen(l:foldtext)/2)
            " note trailing space on next line
            setlocal fillchars+=fold:\
        elseif !exists('b:foldpat') || b:foldpat==0
            let l:foldtext = ' '.(v:foldend-v:foldstart).' lines folded'.v:folddashes.'|'
            let l:endofline = (&textwidth>0 ? &textwidth : 80)
            let l:linetext = strpart(getline(v:foldstart),0,l:endofline-strlen(l:foldtext))
            let l:align = l:endofline-strlen(l:linetext)
            setlocal fillchars+=fold:-
        elseif b:foldpat==1
            let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strlen(line('$'))+1, l:numwidth) : 0)
            let l:foldtext = ' '.v:folddashes
            let l:linetext = substitute(getline(v:foldstart),'\s\+$','','')
            let l:linetext .= ' ---'.(v:foldend-v:foldstart-1).' lines--- '
            let l:linetext .= substitute(getline(v:foldend),'^\s\+','','')
            let l:linetext = strpart(l:linetext,0,l:align-strlen(l:foldtext))
            let l:align -= strlen(l:linetext)
            setlocal fillchars+=fold:-
        endif
        return printf('%s%*s', l:linetext, l:align, l:foldtext)
    endfunction
endif
" }}}

" Colors {{{

" set fold color
highlight Folded ctermfg=DarkBlue ctermbg=232

" Gutter color
highlight SignColumn ctermbg=232

" vsplit color
highlight VertSplit ctermbg=0 ctermfg=0

" visual color
hi Visual  ctermbg=0 ctermfg=Grey

" popup menu color
hi Pmenu ctermbg=11 ctermfg=8
hi PmenuSel ctermbg=8 ctermfg=11

" tab color
hi TabLineFill ctermfg=Black ctermbg=Black
hi TabLine ctermfg=DarkBlue ctermbg=Black
hi TabLineSel ctermfg=Red ctermbg=Black
hi Title ctermfg=LightBlue ctermbg=Black

" parenthesis highlighting color
hi MatchParen cterm=bold ctermbg=0 ctermfg=none

" statusline color
highlight statusline ctermbg=0 ctermfg=0
highlight StatusLineNC ctermbg=0 ctermfg=0

" }}}

" Editor ui {{{

" remove statusline
set laststatus=0
set statusline=\

" ruler setting
set ruler
set rulerformat=%-50(%=%M%H%R\ %f%<\ (%n)%4(%)%Y:%{&tw}%9(%l,%c%V%)%4(%)%P%)

" put ⋅ for space at the end of line
" | for tabs
" ˽ for non breakable space
set list
set listchars=tab:\|\ ,trail:⋅,nbsp:˽

" always expand tabs to 4 space
set tabstop=4
set shiftwidth=4
set expandtab

" minimum number of line under and above the cursor
set scrolloff=5

" }}}

" language specs {{{

" Language syntax indent
autocmd FileType python setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType css setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType mako setlocal shiftwidth=2 tabstop=2 expandtab
" Language Automatically removing all trailing whitespace
autocmd FileType python,c,javascript,css,html,xml,htmldjango,mako,vim autocmd BufWritePre <buffer> :%s/\s\+$//e

" Language folding
au Filetype javascript set omnifunc=javascriptcomplete#CompleteJS foldmethod=indent fdl=1
au Filetype c set foldmethod=syntax
au Filetype vim set foldmethod=marker

" }}}

" }}}

" Key map and Plugin conf {{{

" usefull tricks {{{

" remap the leader default: '\'
let mapleader=';'

" map jk for exit insert mode
imap jk <ESC>

" usefull for search, centering the result
nnoremap n nzz
nnoremap N Nzz

" don't use arrow keys
map <right> <nop>
map <left> <nop>
map <up> <nop>
map <down> <nop>
imap <right> <nop>
imap <left> <nop>
imap <up> <nop>
imap <down> <nop>

" }}}

" Plugin keys & nav {{{

" GitGutter - navig through git diff
nmap <leader>c <Plug>GitGutterNextHunk
nmap <leader>C <Plug>GitGutterPrevHunk

" UndoTree
nnoremap <leader>u :UndotreeToggle<cr>

" NeerdTree
"nnoremap <leader>e :NERDTreeToggle<cr>
"let NERDTreeQuitOnOpen=1

" tab keys
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<CR>

" read all file in hexa
nmap <leader>h :%!xxd<cr>
" return to binary
nmap <leader>H :%!xxd -r<cr>

" paste
set pastetoggle=<leader>p

" upload to sprunge.us
command! Sprunge w !curl -F 'sprunge=<-' http://sprunge.us

" ack
let g:ackprg="ack -H --nocolor --nogroup --column"
nmap <leader>f mA:Ack<space>
nmap <leader>fa mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>fA mA:Ack "<C-r>=expand("<cWORD>")<cr>"

" }}}

" Plugin conf {{{

" vim jedi don't auto start completion
let g:jedi#popup_on_dot = 0

" supertab depend on context, usefull to complete snipet and python methodes
let g:SuperTabDefaultCompletionType = "context"

" syntastic
" don't forget to install flake8: pip install flake8
let g:syntastic_python_checkers=['flake8']
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
" ignore line width for syntax checking and add more complexity
" add the following in ~/.config/flake8
"
" [flake8]
" ignore = E501
" max-line-length = 100
" max-complexity = 10

" }}}

" }}}

" persistence {{{
" thanks to TWal https://github.com/TWal

if isdirectory($HOME . '/.vim/backup') == 0
    :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backup

" Save swp files to a less annoying place than the current directory.
if isdirectory($HOME . '/.vim/swap') == 0
    :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=~/.vim/swap//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
    " undofile - This allows you to use undos after exiting and restarting
    if isdirectory($HOME . '/.vim/undo') == 0
        :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=~/.vim/undo//
    set undodir=~/.vim/undo//
    set undofile
endif

" }}}

" search {{{

set ignorecase " Do case insensitive matching
set smartcase " Do smart case matching, search case sensitive if at least one upercase in the patern
set incsearch " Incremental search, start searching will typing patern
set hlsearch

" }}}

" Plugin Memo {{{

" lusty-explorer {{{
"
" <Leader>lf  - Opens filesystem explorer.
" <Leader>lr  - Opens filesystem explorer at the directory of the current file.
" <Leader>lb  - Opens buffer explorer.
" <Leader>lg  - Opens buffer grep.
"
" }}}

" lusty-juggler {{{
"
" <Leader>lj  - Launch the juggler with this key combo
"
" The buffer names are mapped to these keys:
"
"       1st --> a or 1
"       2nd --> s or 2
"       3rd --> d or 3
"       4th --> f or 4
"       5th --> g or 5
"       6th --> h or 6
"       7th --> j or 7
"       8th --> k or 8
"       9th --> l or 9
"       10th --> ; or 0
"
" }}}

" }}}

" vim: set fdm=marker set fenc=utf-8
