set nocompatible "sorry vi

" Plugins {{{
" Using Vim-Plug
call plug#begin('~/.vim/plugged')

" color themes
Plug 'chriskempson/base16-vim'
Plug 'cocopon/iceberg.vim'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'cocopon/colorswatch.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'mhartington/oceanic-next'
Plug 'mhallendal/spacedust-theme'
Plug 'ajh17/Spacegray.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasr/molokai'
Plug 'pbrisbin/vim-colors-off'
Plug 'owickstrom/vim-colors-paramount'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" File Managers
Plug 'tpope/vim-vinegar'
Plug 'cocopon/vaffle.vim'
Plug 'sjl/gundo.vim'

" Emmet for Vim
Plug 'mattn/emmet-vim'

" Ruby on Rails Plugins
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rails'] }
Plug 'tpope/vim-rbenv'

" CODE
Plug 'sheerun/vim-polyglot'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Git for vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'

" Markdown / Writting
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-wordy'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'dbmrq/vim-ditto'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Distraction-free writing
Plug 'junegunn/goyo.vim'

Plug 'junegunn/limelight.vim'

" better terminal integration
Plug 'wincent/terminus'
Plug 'christoomey/vim-tmux-runner'

" Synchronized toggle key mappings
Plug 'tpope/vim-unimpaired'

call plug#end()
"}}}
" Set all the things! {{{
filetype plugin indent on
syntax on
"set syntax=whitespace "don't even know if I need this. I'll google/search vim help regarding it at some point
set encoding=utf8
set lazyredraw          " redraw only when we need to.

" for tab completion and whole system searches using vim's built in search
set path+=**
set wildmenu
set wildmode=list:full

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
set linebreak "better file wrapping
set textwidth=78 "hardwrap at 78 columns
set cursorline
set colorcolumn=80

" Always display the status line
set laststatus=2
"set showtabline=2
set showcmd

set nobackup
set nowritebackup
set noswapfile

set hidden " allow me to have buffers with unsaved changes.
set autoread " autoload files

" Natural splits
set splitbelow
set splitright

set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set gdefault " use the `g` flag by default.
set wildignorecase

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" list invisable characters
set list listchars=tab:\|\ ,trail:·,extends:>,precedes:<,nbsp:~,eol:¬ " show extra space characters
"set list listchars=tab:\¦\ ,trail:·,extends:>,precedes:<,nbsp:~,eol:¬ " show extra space characters
set showbreak=—»»

if has('linebreak')
	let &showbreak='—»» '
	set breakindent
	if exists('&breakindentopt')
		set breakindentopt=shift:2
	endif
endif

set fillchars+=vert:│
" }}}
" Backups {{{

set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.
set undofile

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" }}}
" leader mappings {{{
let mapleader = "\<Space>"
let maplocalleader = ";"
"}}}
" Plugin settings and mappings {{{
" FZF {{{
map <C-f>f :Files<CR>
map <C-f>g :GitFiles?<CR>
map <C-f>b :Buffers<CR>
map <C-f>a :Ag<CR>
map <C-f>m :Marks<CR>
map <C-f>c :BCommits<CR>
map <C-f>l :BLines<CR>
" }}}

" Vaffle Mappings & Settings {{{
function! s:customize_vaffle_mappings() abort
    " Customize key mappings here
    "nmap <leader>; <Plug>(vaffle-open-selected)
    "nmap N        <Plug>(vaffle-new-file)
  endfunction

  augroup vimrc_vaffle
    autocmd!
    autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END
"}}}

" Vinegar Mappings {{{
"nnoremap - :Explore<CR>
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

let g:netrw_banner=0 "disable banner
let g:netrw_altv=1   "open splits on right
let g:netrw_liststyle=3 "tree view
"}}}

" Gundo Settings {{{
nnoremap <leader>gg :GundoToggle<CR>
" }}}

"Syntastic checkers {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}

" Fugitive mappings {{{
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gt :Gcheckout<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
"  }}}

"Goyo&Limelight {{{
" Start distraction-free mode with ctrl+g
map <C-g> :Goyo<CR>

"function! s:goyo_enter()
"	silent !tmux set status off
"  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
"	" set linespace=7
"	set textwidth=0
"	set statusline=\ \ \ \ %M%=%{WordCount()}\ 
"	highlight! StatusLine ctermfg=blue guifg=blue cterm=italic gui=italic ctermbg=NONE guibg=NONE
"	set showbreak=
"	set noshowmode
"	set noshowcmd
"	set scrolloff=999
"	Limelight0.7
"	"GitGutterEnable
"	" ...
"endfunction

"function! s:goyo_leave()
"	silent !tmux set status on
"	silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
"	set showmode
"	set showcmd
"	set scrolloff=5
"	set textwidth=0
"	set colorcolumn=80
"	Limelight!
"	" ...
"endfunction

"autocmd! User GoyoEnter nested call <SID>goyo_enter()
"autocmd! User GoyoLeave nested call <SID>goyo_leave()

" with :q and :q! quit Goyo and the buffer
function! g:GoyoBefore()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! g:GoyoAfter()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

let g:goyo_callbacks = [function('g:GoyoBefore'), function('g:GoyoAfter')]
let g:goyo_width = 85
"let g:goyo_linenr=1

"Limelight settings for unsupported themes
" Color name (:help cterm-colors) or ANSI code
"let g:limelight_conceal_ctermfg = 'lightgray'
"let g:limelight_conceal_ctermfg = 248

" Default: 0.5
"let g:limelight_default_coefficient = 0.5

" Number of preceding/following paragraphs to include (default: 0)
"let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
"let g:limelight_bop = '^\s'
"let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
"let g:limelight_priority = 10

" Limelight and Goyo integration
autocmd! User GoyoEnter Limelight0.6
autocmd! User GoyoLeave Limelight!
"}}}

" Settings for Writting {{{
let g:languagetool_jar  = '/opt/languagetool/languagetool-commandline.jar'

" Online-thesaurus {{{
" disable default keybinding
let g:online_thesaurus_map_keys = 0
" map my own
nnoremap <localleader>st :OnlineThesaurusCurrentWord<CR>
" }}}

" Vim-pencil Configuration {{{
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,.md call pencil#init()
    autocmd FileType text         call pencil#init()
augroup END

let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pencil#joinspaces = 1      " 0=one space, 1=two spaces
let g:pencil#conceallevel = 3     " 0=disable, 1=one char, 2=hide char, 3=hide all (def)
let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)
"}}}

" Vim Ditto {{{
"au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds

nmap <localleader>sd <Plug>ToggleDitto      " Turn it on and off

nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches
" }}}

"Wordy {{{
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
"}}}

	"}}}

	" Vim-Tmux Runner/Navigator {{{
	" Vim Tmux Runner {{{
	nnoremap <leader>to :VtrOpenRunner<CR>
	nnoremap <leader>tr :VtrSendLinesToRunner<CR>
	"}}}
"}}}
"  }}}
" Native vim power! Folds and OmniComplete Settings {{{
" OmniComplete {{{
set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css,scss,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,jade,pug setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript,jquery setlocal omnifunc=javascriptcomplete#CompleteJS
"}}}

" Folds {{{
set foldenable
autocmd FileType html,jade,ruby,eruby,css,scss,sass,js set foldmethod=indent
set foldlevelstart=99   " open folds by default
set foldnestmax=10	"max number of nested folds

" save folds each time you save and exit a file
au BufWinLeave *.* mkview
" reload folds when you open a file
au BufWinEnter *.* silent loadview
"highlight Folded ctermbg=grey ctermfg=blue
"}}}

" Tags {{{
set tags=./tags,tags;$HOME
map <leader>` :! ctags -R .<CR>
"  }}}

" Dictionary Completion {{{
set complete+=kspell
"}}}

" Thesaurus {{{
"set+=thesaurus
"}}}

" Shell Commands {{{

function! s:ExecuteInShell(command)
  let command = join(map(split(a:command), 'expand(v:val)'))
  let winnr = bufwinnr('^' . command . '$')
  silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
  setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number relativenumber
  echo 'Execute ' . command . '...'
  silent! execute 'silent %!'. command
  silent! execute 'resize '
  silent! redraw
  silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
  silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
  echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

" }}}
"}}}
" key bindings {{{
" @@ remapped to enter key while in normal buffer. Thanks to wincent aka Greg Hurrel for this one.
"nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

map <tab> zR
map <s-tab> zM
map Q @q
map E $
map B 0
map K zt
map zh mmzt3<C-u>`m
map \ <C-^>
map ' `
nmap <silent> <BS>  :nohlsearch<CR>

" toggle a fold.
nnoremap s za
nnoremap S zA

nnoremap <C-Space> :bN<CR>

nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize +1<CR>
nnoremap <Down> :resize -1<CR>
nnoremap <S-Left> :vertical resize +10<CR>
nnoremap <S-Right> :vertical resize -10<CR>
nnoremap <S-Up> :resize +10<CR>
nnoremap <S-Down> :resize -10<CR>

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

inoremap <C-c> <C-x><C-o>
inoremap <C-t> <C-x><C-]>
inoremap <C-l> <C-x><C-l>
inoremap <C-f> <C-x><C-f>

" map leader bindings {{{
nnoremap <leader><leader> <C-^>
nnoremap <leader>q :quit<CR>
nnoremap <leader>a :qa<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :xa<CR>
nnoremap <leader>f :find<space>
nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <leader>c :checktime<CR>
nnoremap <leader>d <PageDown>
nnoremap <leader>u <PageUp>
nnoremap <leader>l :Limelight!<CR>
nnoremap <leader>L :Limelight0.6<CR>
nnoremap <leader>s :mks!<CR>
"nnoremap <localleader>ww :mks!<CR>
nnoremap <leader>o :source Session.vim<CR>

" create splits
" vertical splits
noremap <leader>vv :vsp<CR>
noremap <leader>vf :vsp<space>
noremap <leader>vb :vert sb<space>
noremap <leader>ve :vsp<space>
" horizontal splits
noremap <leader>hh :sp<CR>
noremap <leader>hf :sf<space>
noremap <leader>hb :sb<space>
noremap <leader>he :sp<space>
" tabs
noremap <leader>tt :tab split<CR>
noremap <leader>tf :tabf<space>
noremap <leader>tb :tabs<CR>
noremap <leader>te :tabe<space>
noremap <leader>th :tab help<space>

" toggle spell check z= with
function! FixLastSpellingError()
  normal! ms[s1z=`s"
endfunction

map <C-s> :call FixLastSpellingError()<cr>
inoremap <C-s> <esc>:call FixLastSpellingError()<cr>a
" }}}

" map local leader bindings {{{
nnoremap <localleader>l >>
nnoremap <localleader>h <<
nnoremap <localleader>k O<esc>
nnoremap <localleader>j o<esc>
inoremap <localleader>l <C-t>
inoremap <localleader>h <C-d>
vnoremap <localleader>l >gv
vnoremap <localleader>h <gv
nnoremap <localleader>sr :%s/
vnoremap <localleader>sr :%s/
nnoremap <localleader>ss :setlocal spell! spelllang=en_us<cr>
nnoremap <localleader>sg gqap
nnoremap <localleader>sf z=
nnoremap <localleader>sa zg
noremap <silent> <localleader>sw :<C-u>NextWordy<cr>
noremap <silent> <localleader>SW :NoWordy<cr>
nnoremap <localleader>sp :TogglePencil<CR>
nnoremap <localleader>wn :w!<bar>mks!<space>
"nnoremap <localleader>ww :mks!<CR>
nnoremap <localleader>wo :source<space>

"}}}

" map escape to pressing ;; at the same time {{{
"inoremap <localleader>; <Esc>
"vnoremap <localleader>; <Esc>gV
"cnoremap <localleader>; <Esc>
"}}}

" Better toggling between splits {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"}}}

" Faster scrolling {{{
"nnoremap <C-e> 3<C-e>
"nnoremap <C-y> 3<C-y>
"}}}

" Alt Keybindings {{{
inoremap <M-h> <left>
inoremap <M-j> <down>
inoremap <M-k> <up>
inoremap <M-l> <right>
nnoremap <M-h> gT
nnoremap <M-l> gt
" Tab navigation in with alt-#
"noremap <A-1> :tabnext 1<CR>
"noremap <A-2> :tabnext 2<CR>
"noremap <A-3> :tabnext 3<CR>
"noremap <A-4> :tabnext 4<CR>
"noremap <A-5> :tabnext 5<CR>
"noremap <A-6> :tabnext 6<CR>
"noremap <A-7> :tabnext 7<CR>
"noremap <A-8> :tabnext 8<CR>
"noremap <A-9> :tabnext 9<CR>
"noremap <A-0> :tabnext 0<CR>

noremap <A-1>  :colorscheme seoul256<CR>:hi! Comment term=italic cterm=italic gui=italic<CR>:hi! myModeColor cterm=bold gui=bold term=reverse<CR>
noremap <A-2>  :colorscheme pencil<CR>:hi! Comment term=italic cterm=italic gui=italic<CR>:hi! myModeColor cterm=bold gui=bold term=reverse<CR>
noremap <A-3>  :colorscheme OceanicNextLight<CR>:hi! Comment term=italic cterm=italic gui=italic<CR>:hi! myModeColor cterm=bold gui=bold term=reverse<CR>
noremap <A-4>  :colorscheme solarized8_light<CR>:hi! Comment term=italic cterm=italic gui=italic<CR>:hi! myModeColor cterm=bold gui=bold term=reverse<CR>
noremap <A-5>  :colorscheme gruvbox<CR>:hi! Comment term=italic cterm=italic gui=italic<CR>:hi! myModeColor cterm=bold gui=bold term=reverse<CR>
noremap <A-6>  :colorscheme OceanicNext<CR>:hi! Comment term=italic cterm=italic gui=italic<CR>:hi! myModeColor cterm=bold gui=bold term=reverse<CR>
noremap <A-7>  :colorscheme molokai<CR>:hi! Comment term=italic cterm=italic gui=italic<CR>:hi! myModeColor cterm=bold gui=bold term=reverse<CR>
noremap <A-8>  :colorscheme spacegray<CR>:hi! Comment term=italic cterm=italic gui=italic<CR>:hi! myModeColor cterm=bold gui=bold term=reverse<CR>
noremap <A-9>  :colorscheme iceberg<CR>:hi! Comment term=italic cterm=italic gui=italic<CR>:hi! myModeColor cterm=bold gui=bold term=reverse<CR>
noremap <A-0>  :colorscheme nord<CR>:hi! Comment term=italic cterm=italic gui=italic<CR>:hi! myModeColor cterm=bold gui=bold term=reverse<CR>
" }}}

" Incremental Yanking {{{
" From http://howivim.com/2016/damian-conway/
" Make v<motions>Y act like an incremental v<motion>y
vnoremap <silent>       Y  <ESC>:silent let @y = @"<CR>gv"Yy:silent let @" = @y<CR>

" Make Y<motion> act like an incremental y<motion>
nnoremap <silent><expr> Y  Incremental_Y()

function! Incremental_Y ()
    " After the Y operator, read in the associated motion
    let motion = nr2char(getchar())

    " If it's a (slowly typed) YY, do the optimized version instead (see below)
    if motion == 'Y'
        call Incremental_YY()
        return

    " If it's a text object, read in the associated motion
    elseif motion =~ '[ia]'
        let motion .= nr2char(getchar())
    endif

    " If it's a search, read in the associated pattern
    elseif motion =~ '[/?]'
        let motion .= input(motion) . "\<CR>"
    endif

    " Copy the current contents of the default register into the 'y register
    let @y = @"

    " Return a command sequence that yanks into the 'Y register,
    " then assigns that cumulative yank back to the default register
    return '"Yy' . motion . ':let @" = @y' . "\<CR>"
endfunction


" Make YY act like an incremental yy
nnoremap <silent>  YY  :call Incremental_YY()<CR>

function! Incremental_YY () range
    " Grab all specified lines and append them to the default register
    let @" .= join(getline(a:firstline, a:lastline), "\n") . "\n"
endfunction
" }}}

" rename current file, via Gary Bernhardt {{{
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>r :call RenameFile()<cr>
"}}}
"}}}
" Poor Woman's Code Snippets {{{
" HTML {{{
nnoremap <localleader>ih5 :-1read ~/Dropbox/.dotfiles/vim/html/.skeleton.html<CR>4jwf<i
"}}}

" Ruby {{{
inoremap <localleader>rdf <esc>Idef <esc>A<enter><enter>end<esc>kI<tab>
inoremap <localleader>rh <ekc>I<%=  =><esc>F=hi
"}}}

"}}}
" NeoVim Specific {{{
tnoremap <localleader>; <C-\><C-n>
"To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" To simulate |i_CTRL-R| in terminal-mode:
:tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

"To use `Ctrl+{h,j,k,l}` to navigate windows from any mode:
    :tnoremap <C-h> <C-\><C-N><C-w>h
    :tnoremap <C-j> <C-\><C-N><C-w>j
    :tnoremap <C-k> <C-\><C-N><C-w>k
    :tnoremap <C-l> <C-\><C-N><C-w>l
    :inoremap <C-h> <C-\><C-N><C-w>h
    :inoremap <C-j> <C-\><C-N><C-w>j
    :inoremap <C-k> <C-\><C-N><C-w>k
    :inoremap <C-l> <C-\><C-N><C-w>l

" Create terminal splits

noremap <leader>vt :vsp term://zsh<CR>i
noremap <leader>ht :sp term://zsh<CR>i
"}}}
" Theme and Styling {{{

"Change theme depending on the time of day {{{
colorscheme seoul256
let hr = (strftime('%H'))
if hr >= 17
setlocal background=dark
elseif hr >= 6
setlocal background=light
elseif hr >= 0
setlocal background=dark
endif
"}}}

" Color theme settings {{{
" seoul256 {{{
"let g:seoul256_srgb = 1
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 237
"" seoul256 (light):
""   Range:   252 (darkest) ~ 256 (lightest)
""   Default: 253
"let g:seoul256_light_background = 253
"
"" brighten/dim background - a'la macOS dim screen function keys
"" 233 (darkest) ~ 239 (lightest) 252 (darkest) ~ 256 (lightest)
"function! Seoul256Brighten()
"    if g:seoul256_background == 239
"        let g:seoul256_background = 252
"    elseif g:seoul256_background == 256
"        let  g:seoul256_background = 256
"    else
"        let g:seoul256_background += 1
"    endif
"    colo seoul256
"endfunction
""
"function! Seoul256Dim()
"    if g:seoul256_background == 252
"        let g:seoul256_background = 239
"    elseif g:seoul256_background == 233
"        let g:seoul256_background = 233
"    else
"        let g:seoul256_background -= 1
"    endif
"    colo seoul256
"endfunction

"nmap <M--> :call Seoul256Dim()<CR>
"nmap <M-=> :call Seoul256Brighten()<CR>

"colorscheme seoul256
"
"}}}
" gruvbox {{{
let g:gruvbox_termguicolors=256
let g:gruvbox_italic=1
" gruvbox dark:
"  Range: 234 (hardest) ~ 236 (softest)
"  Default: 235
"let g:gruvbox_background = 235
" gruvbox light:
"  Range: 228 (softest) ~ 230 (hardest)
"  Default: 229
"let g:gruvbox_background = 229
"}}}
" solarized {{{{
let g:solarized_term_italics = 1

"set background=light
"colorscheme solarized8_light

"nnoremap  <M-b> :<c-u>exe "colors" (g:colors_name =~# "dark"
"    \ ? substitute(g:colors_name, 'dark', 'light', '')
"    \ : substitute(g:colors_name, 'light', 'dark', '')
"    \ )<cr>

fun! Solarized8Contrast(delta)
  let l:schemes = map(["_low", "_flat", "", "_high"], '"solarized8_".(&background).v:val')
  exe "colors" l:schemes[((a:delta+index(l:schemes, g:colors_name)) % 4 + 4) % 4]
endf

"nmap <localleader>- :<c-u>call Solarized8Contrast(-v:count1)<cr>
"nmap <localleader>= :<c-u>call Solarized8Contrast(+v:count1)<cr>
" }}}
" molokai {{{
"let g:rehash256 = 1
let g:molokai_original = 1
" }}}
" spacegray {{{
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1
" }}}
" }}}

" Base16 {{{
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if has('termguicolors')
  set termguicolors
endif

"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background
"endif
"
"" Make nvim bkg transparent
"highlight Normal ctermbg=none guibg=none
"highlight NonText ctermbg=none guibg=none
" }}}

" italic comments {{{
set t_ZH=[3m   "  character is created by ctrl-v <esc>
set t_ZR=[23m
highlight Comment term=italic cterm=italic gui=italic 
" }}}

"" Statusline {{{

"let s:modes = {
"      \ 'n': 'N', 
"      \ 'i': 'I', 
"      \ 'R': 'R', 
"      \ 'v': 'V', 
"      \ 'V': 'VL', 
"      \ "\<C-v>": 'VB',
"      \ 'c': 'C',
"      \ 's': 'select', 
"      \ 'S': 's-line', 
"      \ "\<C-s>": 's-block', 
"      \ 't': 'T'
"      \}

function! StatusLinePercent()
  return (100 * line('.') / line('$')) . '%'
endfunction

function! StatusLineLeftInfo()
 let branch = fugitive#head()
 let filename = '' != expand('%:t') ? expand('%:t') : '{no name}'
 if branch !=# ''
   return printf("\ %s\/%s", branch, filename)
	 "⎇
 endif
 return filename
endfunction

"function! Rbenv()
"	return system("rbenv version | awk '{printf $1}'")
"endfunction

function! S_gitgutter()
  if exists('b:gitgutter')
    let l:summary = b:gitgutter.summary
    if l:summary[0] != 0 || l:summary[1] != 0 || l:summary[2] != 0
      return '['.'+'.l:summary[0].'~'.l:summary[1].'-'.l:summary[2].']'
    endif
  endif
  return ''
endfunction

"" symbol
"set statusline+=\ ∡

"if version >= 700
"  au InsertEnter * hi StatusLine cterm=NONE ctermbg=cyan ctermfg=black
"  au InsertLeave * hi StatusLine cterm=NONE ctermfg=white ctermbg=black
"endif

""}}}

" Statusline-ALT {{{

hi! StatusLine cterm=NONE gui=NONE ctermbg=black ctermfg=white guibg=black guifg=white
hi! StatusLineNC term=italic cterm=italic gui=italic ctermbg=NONE guibg=NONE ctermfg=gray guifg=gray
hi! myModeColor cterm=bold gui=bold term=reverse
hi! myNotifyColor cterm=bold gui=bold term=reverse ctermfg=red guifg=red

function! StatusLineMode()
    let mode = mode()

    if mode == "n"
				"exe 'hi! myModeColor cterm=bold ctermbg=white ctermfg=black'
				"exe 'hi! myInfoColor cterm=italic ctermbg=black ctermfg=white'
				"exe 'hi! myStatsColor cterm=NONE ctermbg=black ctermfg=white'
        return "N"
    elseif mode == "no"
        return "OPERATOR"
    elseif mode == "v" || mode == "V"
				"exe 'hi! myModeColor cterm=bold ctermbg=white ctermfg=yellow'
				"exe 'hi! myInfoColor ctermbg=yellow ctermfg=white'
				"exe 'hi! myStatsColor ctermbg=yellow ctermfg=white'
        return "V"
		elseif mode == "\<C-v>"
				"exe 'hi! myModeColor cterm=bold ctermbg=white ctermfg=yellow'
				"exe 'hi! myInfoColor ctermbg=yellow ctermfg=white'
				"exe 'hi! myStatsColor ctermbg=yellow ctermfg=white'
				return "VB"
    elseif mode == "s" || mode == "S" || mode == ""
        return "S"
    elseif mode == "i"
				"exe 'hi! myModeColor cterm=bold ctermbg=white ctermfg=cyan'
				"exe 'hi! myInfoColor ctermbg=cyan ctermfg=white'
				"exe 'hi! myStatsColor ctermbg=cyan ctermfg=white'
        return "I"
    elseif mode == "r" || mode == "Rv"
				"exe 'hi! myModeColor cterm=bold ctermbg=12 ctermfg=00'
				"exe 'hi! myInfoColor ctermbg=00 ctermfg=12'
				"exe 'hi! myStatsColor ctermbg=00 ctermfg=12'
        return "R"
    elseif mode == "t"
				"exe 'hi! myModeColor cterm=bold ctermbg=white ctermfg=black'
				"exe 'hi! myInfoColor ctermbg=black ctermfg=white'
				"exe 'hi! myStatsColor ctermbg=black ctermfg=white'
        return "T"
    else
        "call GoodWolfHL('GWStatusLineMode', 'coal', 'lime', 'bold')
        "call GoodWolfHL('GWStatusLineModeX', 'lime', 'deepergravel')
        "call GoodWolfHL('GWStatusLineModeY', 'lime', 'deepgravel')
        return "OTHER"
    endif
endfunction

function! SetStatusLine(winnr)
    let s = ""

    if a:winnr == winnr()
        let errors = SyntasticStatuslineFlag()

        let s .= "%#myModeColor#"
        let s .= " "
        let s .= "%{StatusLineMode()}"
        let s .= " "
        let s .= "%*"
        "let s .= "⮀ "

        "let s .= "%#myInfoColor#"
        let s .= " "
        let s .= "%{StatusLineLeftInfo()}%r%{PencilMode()}"
        "let s .= "%*"
        "let s .= "%#myStatsColor#"
        let s .= " %{S_gitgutter()}"
        let s .= " "
        "let s .= "%*"
        let s .= "%="

        let s .= "%<"
        let s .= " ∆ %{strftime('%d\ %b\ %I:%M%P')}         "

        "let s .= "%#myInfoColor#"
        let s .= " ≡ %l/%L\ "
				"let s .= "⨳ \"%{v:register}\ "
        "let s .= "%*"

        let s .= "%#myNotifyColor#"
				let s .= " %M"
				let s .= "%*"
        let s .= "%#myModeColor#"
				let s .= "%n "
				let s .= "%*"
    else
        let s .= "%#StatusLineNC#"
        let s .= "%f"
    endif

    return s
endfunction

function! RefreshStatusLine()
    for nr in range(1, winnr('$'))
        call setwinvar(nr, '&statusline', '%!SetStatusLine(' . nr . ')')
    endfor
endfunction

augroup statusline
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * call RefreshStatusLine()
augroup END

"if version >= 700
"  au InsertEnter * hi StatusLine cterm=NONE gui=NONE ctermbg=cyan ctermfg=white guibg=cyan guifg=white
"  au InsertLeave * hi StatusLine cterm=NONE gui=NONE ctermfg=white ctermbg=black guifg=white guibg=black
"endif

" }}}

" Tabline {{{
" from https://stackoverflow.com/a/33765365
set tabline=%!MyTabLine()  " custom tab pages line
function! MyTabLine()
  let s = ''
  " loop through each tab page
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    if i + 1 == tabpagenr()
      let s .= '%#TabLineTitle#' " WildMenu
    else
      let s .= '%#Tabline#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T '
    " set page number string
    let s .= i + 1 . ''
    " get buffer names and statuses
    let n = ''  " temp str for buf names
    let m = 0   " &modified counter
    let buflist = tabpagebuflist(i + 1)
    " loop through each buffer in a tab
    for b in buflist
      if getbufvar(b, "&buftype") == 'help'
        " let n .= '[H]' . fnamemodify(bufname(b), ':t:s/.txt$//')
      elseif getbufvar(b, "&buftype") == 'quickfix'
        " let n .= '[Q]'
      elseif getbufvar(b, "&modifiable")
        let n .= fnamemodify(bufname(b), ':t') . ', ' " pathshorten(bufname(b))
      endif
      if getbufvar(b, "&modified")
        let m += 1
      endif
    endfor
    " let n .= fnamemodify(bufname(buflist[tabpagewinnr(i + 1) - 1]), ':t')
    let n = substitute(n, ', $', '', '')
    " add modified label
    if m > 0
      let s .= '+'
      " let s .= '[' . m . '+]'
    endif
    if i + 1 == tabpagenr()
      let s .= ' %#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
		" add space before file name
    let s .= ' '
    " add buffer names
    if n == ''
      let s.= '[New]'
    else
      let s .= n
    endif
    " switch to no underlining and add final space
    let s .= ' '
  endfor
  let s .= '%#TabLineFill#%T'
  " right-aligned close button
  " if tabpagenr('$') > 1
  "   let s .= '%=%#TabLineFill#%999Xclose'
  " endif
  return s
endfunction

hi TabLine cterm=italic gui=italic ctermbg=NONE guibg=NONE ctermfg=gray guifg=gray
hi TabLineSel cterm=NONE gui=NONE ctermbg=black guibg=black ctermfg=white guifg=white
hi TabLineTitle cterm=bold gui=bold ctermbg=white guibg=white ctermfg=black guifg=black
" }}}

" Writing Themes and styling {{{
" Markdown functions and autocmds {{{
" turn-on distraction free writing mode for markdown files


function! MarkdownFolds()
  let thisline = getline(v:lnum)
	if match(thisline, '^######') >= 0
    return ">6"
	elseif match(thisline, '^#####') >= 0
    return ">5"
	elseif match(thisline, '^####') >= 0
    return ">4"
  elseif match(thisline, '^###') >= 0
    return ">3"
  elseif match(thisline, '^##') >= 0
    return ">2"
  elseif match(thisline, '^#') >= 0
    return ">1"
  else
    return "="
  endif
endfunction

let g:word_count="<unknown>"
set updatetime=1000
augroup WordCounter
  au!  CursorHold,CursorHoldI * call UpdateWordCount()
augroup END
function WordCount()
  return g:word_count
endfunction

function UpdateWordCount()
 let lnum = 1
 let n = 0
 while lnum <= line('$')
   let n = n + len(split(getline(lnum)))
   let lnum = lnum + 1
 endwhile
 let g:word_count = n
endfunction

function! DistractionFreeWriting()
    "colorscheme seoul256
		"colorscheme pencil
    let g:gitgutter_override_sign_column_highlight = 0
    "Change theme depending on the time of day
    "let hr = (strftime('%H'))
    "if hr >= 17
    "setlocal background=dark
    "elseif hr >= 6
    "setlocal background=light
    "elseif hr >= 0
    "setlocal background=dark
    "endif
    highlight FoldColumn ctermbg=NONE guibg=NONE
    highlight SignColumn ctermbg=NONE guibg=NONE
    highlight GitGutterAdd ctermbg=NONE guibg=NONE
    highlight GitGutterChange ctermbg=NONE guibg=NONE
    highlight GitGutterDelete ctermbg=NONE guibg=NONE
    highlight GitGutterChangeDelete ctermbg=NONE guibg=NONE
    setlocal filetype=markdown
    setlocal textwidth=0
    setlocal showbreak=
    setlocal spell
    set spellsuggest=15
    "let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    let g:markdown_fenced_languages = ['html', 'css', 'bash=sh']
    setlocal nonumber
    setlocal norelativenumber
    setlocal foldmethod=expr
    setlocal foldexpr=MarkdownFolds()
    setlocal foldtext=getline(v:foldstart).'\ \[\~'.v:foldlevel.'\:\+'.(v:foldend-v:foldstart).'\]'
    setlocal foldlevel=6
    setlocal foldcolumn=4
    setlocal cpo+=J
		set statusline=\ \ \ \ %M%=%{WordCount()}\ 
		highlight! StatusLine ctermfg=red guifg=red cterm=italic gui=italic ctermbg=NONE guibg=NONE
    Goyo 85
endfunction

augroup ft_markdown
    au!
    au BufNewFile,BufRead *.md setlocal filetype=markdown
    au BufNewFile,BufRead *.md call DistractionFreeWriting()
    au Filetype markdown nnoremap <buffer> <silent> <localleader>; :Goyo 85<CR>:GitGutterEnable<CR>:set statusline=\ \ \ \ %M%=%{WordCount()}\ <CR>:hi StatusLine ctermfg=red guifg=red cterm=italic gui=italic ctermbg=NONE guibg=NONE<CR>:set filetype=markdown<CR>
    au Filetype markdown inoremap <buffer> <localleader>c [//]: # ()<esc>i
    au Filetype markdown nnoremap <buffer> <localleader>c i[//]: # ()<esc>i
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
    au Filetype markdown nnoremap <buffer> <localleader>3 I###<space><esc>
    au Filetype markdown nnoremap <buffer> <leader>- :Limelight!<CR>
    au Filetype markdown nnoremap <buffer> <leader>1 :Limelight0.1<CR>
    au Filetype markdown nnoremap <buffer> <leader>2 :Limelight0.2<CR>
		au Filetype markdown nnoremap <buffer> <leader>3 :Limelight0.3<CR>
    au Filetype markdown nnoremap <buffer> <leader>4 :Limelight0.4<CR>
    au Filetype markdown nnoremap <buffer> <leader>5 :Limelight0.5<CR>
    au Filetype markdown nnoremap <buffer> <leader>6 :Limelight0.6<CR>
    au Filetype markdown nnoremap <buffer> <leader>7 :Limelight0.7<CR>
    au Filetype markdown nnoremap <buffer> <leader>8 :Limelight0.8<CR>
    au Filetype markdown nnoremap <buffer> <leader>9 :Limelight0.9<CR>
    au Filetype markdown nnoremap <buffer> <leader>0 :Limelight0.0<CR>
    au Filetype markdown nnoremap <buffer> <leader>+ :Limelight1.0<CR>
augroup END

"}}}
" }}}

" Colorcolumn settings {{{
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" }}}
" reversed highlights {{{
"hi CursorLine cterm=bold
"hi CursorColumn term=NONE cterm=reverse
"hi Visual term=reverse cterm=reverse
" }}}
" Neovim-Guicursor {{{
set guicursor=n:blinkon0
set guicursor=i-ci-o:ver50-icursor-blinkwait300-blinkon200-blinkoff150
set guicursor=r-cr:hor20-blinkwait300-blinkon200-blinkoff150
	"}}}

hi VertSplit cterm=NONE gui=NONE ctermbg=NONE guibg=NONE

" Focus {{{
" Thanks to
" https://www.reddit.com/r/neovim/comments/4dyaqt/how_i_can_dim_inactive_windows/d2684me/
" for this solution

hi def Dim cterm=none ctermbg=none ctermfg=242

function! s:DimInactiveWindow()
    syntax region Dim start='' end='$$$end$$$'
    set nocursorline
		set colorcolumn=
endfunction

function! s:UndimActiveWindow()
    ownsyntax
		set cursorline
		set colorcolumn=80
endfunction

autocmd WinEnter * call s:UndimActiveWindow()
autocmd BufEnter * call s:UndimActiveWindow()
autocmd WinLeave * call s:DimInactiveWindow()
" }}}

" Coding enviornments {{{

" Lua {{{

function! LuaTheme()
	let hr = (strftime('%H'))
	if hr >= 17
	setlocal background=dark
	colorscheme OceanicNext
	elseif hr >= 6
	setlocal background=light
	colorscheme OceanicNextLight
	elseif hr >= 0
	setlocal background=dark
	colorscheme OceanicNext
	endif
endfunction

augroup ft_lua
    au!

    au Filetype lua call LuaTheme()
		au FileType lua hi! Comment term=italic cterm=italic gui=italic
		au FileType lua hi! myModeColor term=reverse cterm=bold gui=bold
    au Filetype lua inoremap <buffer> <localleader>c -- <esc>A
    au Filetype lua nnoremap <buffer> <localleader>c i--<space><esc>A
    au Filetype lua nnoremap <buffer> <CR> :!love %:p:h<CR>
    au Filetype lua nnoremap <buffer> <M-tab> :Sedit ft=lua<CR>:vertical-resize 75<CR>
		au Filetype lua nnoremap <buffer> <M-Space> :LuaWorkspace<CR>
augroup END

" }}}

" Vim {{{

augroup ft_vim
    au!

		au FileType vim colorscheme nord
		au FileType vim hi! Comment term=italic cterm=italic gui=italic
		au FileType vim hi! myModeColor term=reverse cterm=bold gui=bold
    au FileType vim setlocal foldmethod=marker

augroup END

" }}}

" zsh/conf {{{

augroup ft_zsh
    au!

		au FileType zsh colorscheme pencil
		au FileType zsh hi! Comment term=italic cterm=italic gui=italic
		au FileType zsh hi! myModeColor term=reverse cterm=bold gui=bold
    au FileType zsh setlocal foldmethod=marker

augroup END

augroup ft_conf
    au!

		au FileType conf colorscheme Spacedust
		au FileType conf hi! Comment term=italic cterm=italic gui=italic
		au FileType conf hi! myModeColor term=reverse cterm=bold gui=bold
    au FileType conf setlocal foldmethod=marker

augroup END

" }}}
" }}}
"}}}
" Workspace Setup {{{
" ----------------
function! DefaultWorkspace()
    " Rough num columns to decide between laptop and big monitor screens
    let numcol = 2
    if winwidth(0) >= 220
        let numcol = 3
    endif

    if numcol == 3
        e term://zsh
        file Shell\ Two
        vnew
    endif

    vsp term://zsh
		file scratch
    sp term://zsh
		file test
    wincmd k
    resize 6
    vertical-resize 75
    wincmd h
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()

highlight TermCursor ctermfg=red guifg=red
":au TermOpen * if &buftype == 'terminal' | :startinsert | endif
":autocmd TermOpen * setlocal statusline=%#myModeColor#\ \»\ %*%<%{b:term_title}

nnoremap <M-Space> :DefaultWorkspace<CR>

" }}}
" Lua Workspace Setup {{{
" ----------------
function! LuaWorkspace()
    " Rough num columns to decide between laptop and big monitor screens
    let numcol = 3
    if winwidth(0) >= 220
        let numcol = 4
    endif

    if numcol == 4
        e term://zsh
        file shell2
        vnew
    endif

		vsp
    vsp term://zsh
		file test
    vertical-resize 55
		wincmd h
		wincmd h
		sp term://zsh
		file shell
		resize 6
		wincmd k
    Sedit filetype=lua
    vertical-resize 25
    wincmd l
endfunction
command! -register LuaWorkspace call LuaWorkspace()

highlight TermCursor ctermfg=red guifg=red
":au TermOpen * if &buftype == 'terminal' | :startinsert | endif
":autocmd TermOpen * setlocal statusline=%#myModeColor#\ \»\ %*%<%{b:term_title}

" }}}
" Scratch buffers {{{
" Thanks to http://dhruvasagar.com/2014/03/11/creating-custom-scratch-buffers-in-vim
function! ScratchEdit(cmd, options)
	exe a:cmd tempname()
	setl buftype=nofile bufhidden=wipe nobuflisted
	if !empty(a:options) | exe 'setl' a:options | endif
endfunction

command! -bar -nargs=* Sedit call ScratchEdit('edit', <q-args>)
command! -bar -nargs=* Ssp call ScratchEdit('split', <q-args>)
command! -bar -nargs=* Svsp call ScratchEdit('vsplit', <q-args>)
command! -bar -nargs=* Stab call ScratchEdit('tabe', <q-args>)
" }}}
