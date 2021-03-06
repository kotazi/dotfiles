"-----------------------------------------------------------------
"@title My .vimrc 
"@author Yoshiya Ito
"@version 2.0
"-----------------------------------------------------------------

"-----------------------------------------------------------------
"neobundle.vim header
"-----------------------------------------------------------------
let g:neobundle_default_git_protocol='git'
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

"-----------------------------------------------------------------
"enable mouse click for iTerm
"-----------------------------------------------------------------
if has("mouse") " Enable the use of the mouse in all modes
    set mouse=a
endif
"-----------------------------------------------------------------
"neobundle.vim main module
"-----------------------------------------------------------------
NeoBundle "Shougo/neocomplcache" "code complete
NeoBundle "scrooloose/syntastic" "syntax checker
NeoBundle "Shougo/neosnippet" "code snipets
NeoBundle "Shougo/neosnippet-snippets" "snipet file
NeoBundle "honza/vim-snippets" "code snipets
NeoBundle "davidhalter/jedi-vim" 
NeoBundle "Shougo/vimshell.git" "shell of vim
NeoBundle "thinca/vim-quickrun" "quick run
NeoBundle "bling/vim-airline" "airline of status bar
NeoBundle "scrooloose/nerdtree" "nerdtree 
NeoBundle "majutsushi/tagbar" "tagbar
NeoBundle 'klen/python-mode' "python syntax
NeoBundle "jelera/vim-javascript-syntax" "javascript syntax
NeoBundle 'pangloss/vim-javascript' "javascript syntax
NeoBundle "itspriddle/vim-javascript-indent" "javascript indent
NeoBundle 'jiangmiao/simple-javascript-indenter' "simple javascript indent
NeoBundle "leshill/vim-json" "json syntax
NeoBundle "digitaltoad/vim-jade" "jade syntax
NeoBundle "wavded/vim-stylus" "stylus syntax
NeoBundle "tomasr/molokai" "color scheme
NeoBundle "itchyny/landscape.vim" "color scheme 2
NeoBundle 'altercation/vim-colors-solarized' "color scheme 3
NeoBundle 'mustache/vim-mustache-handlebars' "hbs syntax
"-----------------------------------------------------------------
"neobundle.vim hooter
"-----------------------------------------------------------------
filetype plugin indent on     " required!
filetype indent on
"-----------------------------------------------------------------
"original vim setting file
"-----------------------------------------------------------------
"show line number
set number
"show title
set title
"show carsole point
set ruler
"show stagus line
set laststatus=2
"no backup
set nowritebackup
"no swap
set noswapfile
"cahnge to normal mode
inoremap <silent> jj <esc>
"indent tab
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set showmatch
set showcmd
"show hex
set display=uhex
"scroll speed up?
set lazyredraw
set ttyfast
"use clipbord
"set clipboard=unnamed,autoselect
"backspace enable for vim 7.4
set bs=start
"----------------------------------------------------------------
"key remap for ()
"----------------------------------------------------------------
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>
"imap // //<left>
"imap /// ///<left>

"-----------------------------------------------------------------
"high speed cursor in keyRemap4Mac
"-----------------------------------------------------------------
noremap j <down>
noremap k <up>
noremap l <right>
noremap h <left>
"-----------------------------------------------------------------
"color setting
"-----------------------------------------------------------------
"syntax hilight
syntax on
"colorscheme
"colorscheme molokai need for
"http://fixture.jp/blog/2012/08/patch-to-disable-molokai-bgcolor/
colorscheme molokai
"colorscheme landscape
"colorscheme solarized
"set background=dark
"airline color
let g:airline_theme = 'dark'
"status line
set t_Co=256
"line color
highlight LineNr ctermfg=226
"row
"set cursorline 
"hi CursorLine ctermbg=102
"virtical
"set cursorcolumn
"hi CursorColumn ctermbg=102
"-----------------------------------------------------------------
"neocomplecache
"-----------------------------------------------------------------
let g:neocomplcache_enable_at_startup=1 "enable neocomplechace
let g:neocomplcache_smartCase = 1 "smart mode

"Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"-----------------------------------------------------------------
"neosnippet
"-----------------------------------------------------------------
"Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" for snippet_complete marker
if has('conceal')
    set conceallevel=2 concealcursor=i "enable neosnippet
endif

"snippet directory
let g:neosnippet#snippets_directory='~/GitHub/dotfiles/snippets' 
"-----------------------------------------------------------------
"nerdtree
"-----------------------------------------------------------------
"auto mode
autocmd vimenter * NERDTree
"display hidden file
let g:NERDTreeShowHidden=1
"tree style
let g:NERDTreeDirArrows=0
"tree width
let NERDTreeWinSize=20
"-----------------------------------------------------------------
"jedi-vim
"-----------------------------------------------------------------
let g:jedi#completions_enabled=1
let g:jedi#popup_on_dot = 0
"let g:jedi#auto_initialization=0
"let g:jedi#popup_select_first=0
"-----------------------------------------------------------------
"jedi and neocomplcache combination
"-----------------------------------------------------------------
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#auto_vim_configuration = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"-----------------------------------------------------------------
"pymode 
"-----------------------------------------------------------------
"folding method and class
let g:pymode_folding = 0
"show document so slow...
let g:pymode_doc=0
"code comletion
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_completion=0
"refactoring tool so slow...
let g:pymode_rope = 0
"-----------------------------------------------------------------
"tag bar
"-----------------------------------------------------------------
"open tagbar
nmap <F2> :TagbarToggle<CR>
"tagbar width
let g:tagbar_width = 20
"auto open tagbar
"autocmd filetype * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)
"----------------------------------------------------------------
"key remap for ()
"----------------------------------------------------------------
let g:mustache_abbreviations = 1
"----------------------------------------------------------------
"yank to clipboard
"----------------------------------------------------------------
set clipboard=unnamed,autoselect
