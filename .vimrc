set nocompatible "sorry vi
filetype off "needed by vundle

" Plugins
"Vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" color themes
Plugin 'chriskempson/base16-vim'

" Fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" Vim Vinegar
Plugin 'tpope/vim-vinegar'

" Emmet for Vim
Plugin 'mattn/emmet-vim'

" For better html indenting 
Plugin 'indenthtml.vim'

" Ruby on Rails Plugins
Plugin 'tpope/vim-rails'

" You Complete Me, Vim
"Plugin 'Valloric/YouCompleteMe'

" Syntastic
Plugin 'vim-syntastic/syntastic'

" Markdown / Writting
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'reedes/vim-wordy'
"Plugin 'dpelle/vim-LanguageTool'
"Plugin 'rhysd/vim-grammarous'

" Distraction-free writing
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'

" tmux
Plugin 'benmills/vimux'

" better terminal integration
Plugin 'wincent/terminus'

" Synchronized toggle key mappings
Plugin 'tpope/vim-unimpaired'

" Vim statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Keep Plugin commands between vundle#begin/end.
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Set all the things!
filetype plugin indent on
syntax on
set syntax=whitespace "don't even know if I need this. I'll google/search vim help regarding it at some point
set encoding=utf8

" for tab completion and whole system searches using vim's built in search
set path+=**
set wildmenu

" Show linenumbers
set ruler
set number
set relativenumber

" search highlighting
set hlsearch

set tabstop=2
set shiftwidth=2
set softtabstop=2
"set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intelligently indent/un-indent new lines based on rules.

" Always display the status line
set laststatus=2

set nobackup
set nowritebackup
set noswapfile

set hidden " allow me to have buffers with unsaved changes.
set autoread " autoload files

set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set gdefault " use the `g` flag by default.

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

"set list listchars=tab:»·,trail:· " show extra space characters
set list listchars=tab:\|\ ,trail:· " show extra space characters

" leader mappings
let mapleader = "\<Space>"
let maplocalleader = ";"

" Plugin settings and mappings
" Ctrlp-plugin
nnoremap <C-p> :CtrlPClearCache<bar>CtrlP<cr>

let g:ctrlp_show_hidden = 1

" NERDTree
" Open NERDTree with ctrl+n
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>

let g:NERDTreeMinimalUI=1

" NERDTree arrow symbols
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Let <leader><leader> work within NERDTree
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'

" Vinegar Mappings
"nnoremap - :Explore<CR>
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let g:netrw_banner=0 "disable banner
let g:netrw_altv=1   "open splits on right
let g:netrw_liststyle=3 "tree view

"Syntastic checkers
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Goyo&Limelight
" Start distraction-free mode with ctrl+g
map <C-g> :Goyo<CR>

function! s:goyo_enter()
	silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	set noshowmode
	set noshowcmd
	set scrolloff=999
	Limelight
	" ...
endfunction

function! s:goyo_leave()
	silent !tmux set status on
	silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	set showmode
	set showcmd
	set scrolloff=5
	Limelight!
	" ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"Limelight settings for unsupported themes
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'darkgray'
let g:limelight_conceal_ctermfg = 8

" Default: 0.5
let g:limelight_default_coefficient = 0.5

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = 10

" Limelight and Goyo integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Settings for Writting
" Markdown Syntax Support
augroup markdown
     au!
     au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:languagetool_jar  = '/opt/languagetool/languagetool-commandline.jar'
"
nnoremap <leader>p :TogglePencil<CR>
" Vim-pencil Configuration
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,.md call pencil#init()
    autocmd FileType text         call pencil#init()
augroup END

let g:pencil#joinspaces = 1

"Wordy
let g:wordy#ring = [
  \ 'weak',
  \ ['being', 'passive-voice', ],
  \ 'puffery',
  \ ['colloquial', 'idiomatic', 'similies', ],
  \ 'art-jargon',
  \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ 'adjectives',
  \ 'adverbs',
  \ ]

noremap <silent> <leader>y :<C-u>NextWordy<cr>
noremap <silent> <leader>Y :NoWordy<cr>

" Dictionary Completion
set complete+=kspell

" Vim-Test Configuration
let test#strategy = "vimux"

" Native vim power!
" OmniComplete
set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

" Folds
set foldmethod=indent
" toggle a fold.
nnoremap <s-o> zA
" save folds each time you save and exit a file
au BufWinLeave *.* mkview
" reload folds when you open a file
au BufWinEnter *.* silent loadview

" key bindings
"inoremap <tab> <C-p>
map <S-t> %
map <S-e> $
map <S-b> 0

" map leader bindings
nnoremap <leader><leader> <C-^>
nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :xit<CR>
nnoremap <leader>f :find 
nnoremap <leader>b :b 
nnoremap <leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

" map local leader bindings
inoremap <localleader>; <C-p>
inoremap <localleader>i <C-x><C-o>
inoremap <localleader>p <C-x><C-f>
nnoremap <localleader>e :e 
nnoremap <localleader>nh :nohl<CR>

" Better toggling between tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map escape to pressing jk at the same time
"inoremap jk <Esc>
"inoremap kj <Esc>
inoremap qq <Esc>
vnoremap qq <Esc>gV
cnoremap qq <Esc>
map <localleader>ll >>
map <localleader>hh <<
inoremap <localleader>ll <C-t>
inoremap <localleader>hh <C-d>

" Faster scrolling
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" toggle spell check with
map <leader>s :setlocal spell! spelllang=en_us<cr>

" Poor Woman's Code Snippets
" HTML
nnoremap <localleader>h5 :-1read ~/.vim/html/.skeleton.html<CR>4jwf<i
inoremap <localleader>hid <esc>I<div id="<esc>A"><enter><enter></div><esc>kI<tab><tab>
inoremap <localleader>hcl <esc>I<div class="<esc>A"><enter><enter></div><esc>kI<tab><tab>
inoremap <localleader>h. class=""<esc>i
inoremap <localleader>h' id=""<esc>i

" CSS
inoremap <localleader>cid <esc>I#<esc>A {<enter><enter>}<esc>kI<tab>
inoremap <localleader>ccl <esc>I.<esc>A {<enter><enter>}<esc>kI<tab>

" Ruby
inoremap <localleader>df <esc>Idef <esc>A<enter><enter>end<esc>kI<tab>
inoremap <localleader>rh <esc>I<%=  =><esc>F=hi

" Markdown
inoremap <localleader>m3 ### <esc>a

" Theme and Styling
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

hi Visual term=reverse cterm=reverse guibg=Grey
"hi Cursor term=reverse cterm=reverse guibg=Grey
"hi iCursor term=reverse cterm=reverse guibg=Gray
"hi CursorLine term=reverse cterm=reverse 

" Vim airline toolbar theme
let g:airline_theme='deus'
let g:airline_section_x = '%{PencilMode()}'
