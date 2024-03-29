"""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""Plugins"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugin
call plug#begin('~/.vim/plugged')

" Syntax highlighting
Plug 'JoshuaKimble/vim-dracula'

" Syntax for js
Plug 'jelera/vim-javascript-syntax'
Plug 'crusoexia/vim-javascript-lib'

" Surround
Plug 'git://github.com/tpope/vim-surround.git'

" NERD Commenter
Plug 'scrooloose/nerdcommenter'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree'

" Sensible vim configuration
Plug 'tpope/vim-sensible'

" ctrlp: full path fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" simple way to use motions
Plug 'https://github.com/easymotion/vim-easymotion.git'

" deoplete autocompletion
Plug 'Shougo/deoplete.nvim'

" syntax checking
Plug 'https://github.com/vim-syntastic/syntastic.git'

" block comments
Plug 'scrooloose/nerdcommenter'

" emmet-vim
Plug 'mattn/emmet-vim'

" gutter git diff
Plug 'airblade/vim-gitgutter'

" formater
Plug 'sbdchd/neoformat'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""Custom Settings""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""
"set space to leader
let mapleader = "\<Space>"

" pastemode toggle
set pastetoggle=<F5>

" eslint for syntastic
let g:syntastic_javascript_checkers = ['eslint']

" ctrlp show hidden files
let g:ctrlp_show_hidden = 1

" Nerdtree show hidden files and winSize
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize=40

" vim cursor
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" insert mode - line
let &t_SI .= "\<Esc>[5 q"

" replace mode - underline
let &t_SR .= "\<Esc>[4 q"

" common - block
let &t_EI .= "\<Esc>[3 q"

" 4 space tabs
set ts=4 sw=4 sts=4 et

" syntax highlighting
syntax on
color dracula
set t_Co=256 

" line numbers
set nu

" NERDCommenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""Mappings"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
map <C-\> :NERDTreeToggle<CR>
" map <C-p> :CtrlP<CR>

" copy, paste and save
vnoremap <C-C> "*ygv
vnoremap <C-V> "*p
inoremap <C-V> <C-R>*
inoremap <C-S> <esc>:w<cr>
nnoremap <C-S> :w<cr>
vnoremap <C-S> :w<cr>

inoremap kj <Esc>
vnoremap <space><space> <Esc>
cnoremap kj <Esc>

" tabs
map tc :tabclose<cr>

" clear search 'ctrl -'
nnoremap <C-_> :noh<cr>

" Quickly edit/reload this configuration file
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>

" Reload init on save
if has ('autocmd') " Remain compatible with earlier versions
	augroup vimrc     " Source vim configuration upon save
	autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
	autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
	augroup END
endif " has autocmd

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
