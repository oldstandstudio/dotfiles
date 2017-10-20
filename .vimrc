set nocompatible "sorry vi
filetype off "needed by vundle

" Plugins {{{
" Using Vim-Plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" color themes
Plug 'chriskempson/base16-vim'
Plug 'cocopon/iceberg.vim'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'cocopon/colorswatch.vim'
"Plug 'cocopon/shadeline.vim'
Plug 'ajh17/Spacegray.vim'

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Ag - Silver Searcher
Plug 'rking/ag.vim'

" File Managers
Plug 'tpope/vim-vinegar'
Plug 'cocopon/vaffle.vim'

" Emmet for Vim
Plug 'mattn/emmet-vim'

" For better html indenting 
"Plug 'indenthtml.vim'
Plug 'tpope/vim-sleuth'

" for haml, sass, and scss support
Plug 'tpope/vim-haml', { 'for': ['haml', 'sass', 'scss'] }

" Support for jade syntax highlighting and indenting
Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }
au BufNewFile,BufReadPost *.jade set filetype=pug

Plug 'dNitro/vim-pug-complete', { 'for': ['pug', 'jade'] }

" Ruby on Rails Plugins
Plug 'tpope/vim-rails', { 'for': ['ruby', 'rails'] }
Plug 'tpope/vim-rbenv'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Git for vim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'

" Markdown / Writting
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-markdown'
Plug 'reedes/vim-wordy'
Plug 'beloglazov/vim-online-thesaurus'
"Plug 'dpelle/vim-LanguageTool'
"Plug 'rhysd/vim-grammarous'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Distraction-free writing
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
"autocmd! User goyo.vim echom 'Goyo is now loaded!'<CR>

Plug 'junegunn/limelight.vim', { 'for': 'markdown' }
Plug 'thinca/vim-zenspace'

" better terminal integration
Plug 'wincent/terminus'
"Plugin 'christoomey/vim-tmux-navigator' "having issues w/tmux and neovim
Plug 'christoomey/vim-tmux-runner'

" Synchronized toggle key mappings
Plug 'tpope/vim-unimpaired'

" Initialize plugin system
call plug#end()
"}}}
" Set all the things! {{{
filetype plugin indent on
syntax on
set syntax=whitespace "don't even know if I need this. I'll google/search vim help regarding it at some point
set encoding=utf8
set lazyredraw          " redraw only when we need to.

" for tab completion and whole system searches using vim's built in search
set path+=**
set wildmenu
set wildmode=full

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
set textwidth=80 "hardwrap at 80 columns
set colorcolumn=80

" Always display the status line
set laststatus=2
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
" }}}
" leader mappings {{{
let mapleader = "\<Space>"
let maplocalleader = ";"
"}}}
" Plugin settings and mappings {{{
" Ctrlp-plugin {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <leader>p :CtrlPBuffer<CR>
"nnoremap <leader>k :CtrlPClearCache<CR>
let g:ctrlp_show_hidden = 1

" CtrlP intagration with Ag
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"}}}

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

function! s:goyo_enter()
	silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	" set linespace=7
	set textwidth=80
	set statusline=%M%=%{WordCount()}
	hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
	set showbreak=
	set colorcolumn=80
	set noshowmode
	set noshowcmd
	set scrolloff=999
	Limelight
	"GitGutterEnable
	" ...
endfunction

function! s:goyo_leave()
	silent !tmux set status on
	silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	set statusline=%<\ %{StatusLineMode()}\ \|\ %t\ %r%{PencilMode()}\ %=%(\ ℓ\ %l/%L\ 𝕔\ %v\ \"%{v:register}\ \|\ %M%n\ %)
	set showmode
	set showcmd
	set scrolloff=5
	set textwidth=80
	set colorcolumn=80
	Limelight!
	" ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

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
autocmd! User GoyoEnter Limelight0.7
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
let g:pencil#joinspaces = 1
let g:pencil#conceallevel = 2     " 0=disable, 1=one char, 2=hide char, 3=hide all (def)
let g:pencil#concealcursor = 'nc'  " n=normal, v=visual, i=insert, c=command (def)
"}}}

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
	"Vim Tmux Navigator {{{
	"let g:tmux_navigator_no_mappings = 1 
"nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
"nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
"nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
"nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <C-f> :TmuxNavigatePrevious<cr>
	"}}}
"}}}
"  }}}
" Native vim power! Folds and OmniComplete Settings {{{
" OmniComplete {{{
set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css,scss,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,jade,pug setlocal omnifunc=htmlcomplete#CompleteTags
"}}}

" Folds {{{
set foldenable
autocmd FileType html,jade,ruby,eruby,css,scss,sass,js set foldmethod=indent
set foldlevelstart=99   " open folds by default
set foldnestmax=10	"max number of nested folds

" toggle a fold.
nnoremap s za
nnoremap S zA
" save folds each time you save and exit a file
au BufWinLeave *.* mkview
" reload folds when you open a file
au BufWinEnter *.* silent loadview
"highlight Folded ctermbg=grey ctermfg=blue
"highlight FoldColumn guibg=darkgrey guifg=white
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
"}}}
" key bindings {{{
" @@ remapped to enter key while in normal buffer. Thanks to wincent aka Greg Hurrel for this one.
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'
"nnoremap <cr> o<esc>

map <tab> zR
map <s-tab> zM
map Q @q
map E $
map B 0
map K zt

" map leader bindings {{{
nnoremap <leader><leader> <C-^>
nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :xit<CR>
nnoremap <leader>f :find<space>
nnoremap <leader>b :b<space>
nnoremap <leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
nnoremap <leader>c :checktime<CR>
"nnoremap <leader>l :ls<CR>
nnoremap <leader>a :Ag!<space>
nnoremap <leader>O :Limelight0.7<CR>
nnoremap <leader>o :Limelight!<CR>
nnoremap <leader>d <PageDown>
nnoremap <leader>u <PageUp>

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

" toggle spell check z= with
function! FixLastSpellingError()
  normal! mm[s1z=`m"
endfunction

map <leader>s :call FixLastSpellingError()<cr>
" }}}
" map local leader bindings {{{
"inoremap <localleader>; <C-p>
inoremap <localleader>c <C-x><C-o>
inoremap <localleader>t <C-x><C-]>
inoremap <localleader>a <C-x><C-l>
inoremap <localleader>d <C-x><C-l>
inoremap <localleader>f <C-x><C-f>
inoremap <localleader>u <C-w>
inoremap <localleader>U <C-u>
nnoremap <localleader>e :e<space>
nnoremap <localleader>nh :nohl<CR>
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
nnoremap <localleader>sg Vgq
nnoremap <localleader>sf z=
nnoremap <localleader>sa zg
noremap <silent> <localleader>sw :<C-u>NextWordy<cr>
noremap <silent> <localleader>SW :NoWordy<cr>
nnoremap <localleader>sp :TogglePencil<CR>
nnoremap <localleader>wn :w!<bar>mks ~/.vim/sessions/
nnoremap <localleader>ww :mks!<bar>wqa!<CR>
nnoremap <localleader>wo :source ~/.vim/sessions/

"}}}

" map escape to pressing ;; at the same time {{{
"inoremap jk <Esc>
"inoremap kj <Esc>
inoremap <localleader>; <Esc>
vnoremap <localleader>; <Esc>gV
cnoremap <localleader>; <Esc>
"}}}

" Better toggling between splits {{{
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"}}}

" Faster scrolling {{{
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
"}}}

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

" CSS {{{
"inoremap <localleader>icid <esc>I#<esc>A {<enter><enter>}<esc>kI<tab>
"inoremap <localleader>iccl <esc>I.<esc>A {<enter><enter>}<esc>kI<tab>
"}}}

" Ruby {{{
inoremap <localleader>rdf <esc>Idef <esc>A<enter><enter>end<esc>kI<tab>
inoremap <localleader>rh <ekc>I<%=  =><esc>F=hi
"}}}

" Markdown {{{

" nnoremap <localleader>mt :Toc<CR>

"		au Filetype markdown nnoremap <localleader>I ciw**<esc>P
"		au Filetype markdown nnoremap <localleader>B ciw****<esc>hP
"		au Filetype markdown nnoremap <localleader>mwf ciw******<esc>hhP
"		au Filetype markdown nnoremap <localleader>mws ciw~~~~<esc>hP
"		au Filetype markdown nnoremap <localleader>m'i ca"**<esc>P
"		au Filetype markdown nnoremap <localleader>m'b ca"****<esc>hP
"		au Filetype markdown nnoremap <localleader>m'f ca"******<esc>hhP
"		au Filetype markdown nnoremap <localleader>m's ca"~~~~<esc>hP
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

" Color theme settings {{{
" seoul256 {{{
let g:seoul256_srgb = 1
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 234
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
"let g:seoul256_light_background = 253

"    colorscheme seoul256
"		"Change theme depending on the time of day
"		let hr = (strftime('%H'))
"		if hr >= 20
"    "colorscheme seoul256
"		setlocal background=dark
"		elseif hr >= 6
"    "colorscheme seoul256-light
"		setlocal background=light
"		elseif hr >= 0
"    "colorscheme seoul256
"		setlocal background=dark
"		endif

"}}}
" gruvbox {{{
let g:gruvbox_termguicolors=256
let g:gruvbox_italic=1
" gruvbox dark:
"  Range: 234 (hardest) ~ 236 (softest)
"  Default: 235
let g:gruvbox_background = 236
" gruvbox light:
"  Range: 228 (softest) ~ 230 (hardest)
"  Default: 229
let g:gruvbox_background = 230
"}}}
" }}}

" Base16 {{{
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"if has('termguicolors')
"	set termguicolors
"endif
" }}}

" Only use cursorline for current window {{{
autocmd WinEnter,FocusGained * setlocal cursorline
autocmd WinLeave,FocusLost   * setlocal nocursorline
" }}}

" italic comments {{{
set t_ZH=[3m   "  character is created by ctrl-v <esc>
set t_ZR=[23m
highlight Comment term=italic cterm=italic gui=italic ctermfg=08
" }}}

" For use with iceberg color theme {{{
"colorscheme iceberg
"set background="dark"
" }}}

" Statusline {{{
" based on https://github.com/fatih/dotfiles/blob/master/vimrc

"hi! StatusLine ctermfg=00 ctermbg=14

let s:modes = {
      \ 'n': 'N', 
      \ 'i': 'I', 
      \ 'R': 'R', 
      \ 'v': 'V', 
      \ 'V': 'VL', 
      \ "\<C-v>": 'VB',
      \ 'c': 'C',
      \ 's': 'select', 
      \ 'S': 's-line', 
      \ "\<C-s>": 's-block', 
      \ 't': 'T'
      \}

let s:prev_mode = ""
function! StatusLineMode()
  let cur_mode = get(s:modes, mode(), '')

  " do not update higlight if the mode is the same
  if cur_mode == s:prev_mode
    return cur_mode
  endif

  if cur_mode == "N"
    exe 'hi! mymodecolor cterm=bold ctermbg=20 ctermfg=00'
    exe 'hi! myinfocolor ctermbg=00 ctermfg=20'
    exe 'hi! mystatscolor ctermbg=00 ctermfg=20'
    exe 'hi! StatusLine ctermfg=00 ctermbg=08'
  elseif cur_mode == "I"
    exe 'hi! myModeColor cterm=bold ctermbg=10 ctermfg=00'
    exe 'hi! myInfoColor ctermbg=00 ctermfg=10'
    exe 'hi! myStatsColor ctermbg=00 ctermfg=10'
    exe 'hi! StatusLine ctermfg=00 ctermbg=08'
  elseif cur_mode == "R"
    exe 'hi! myModeColor cterm=bold ctermbg=12 ctermfg=00'
    exe 'hi! myInfoColor ctermbg=00 ctermfg=12'
    exe 'hi! myStatsColor ctermbg=00 ctermfg=12'
    exe 'hi! StatusLine ctermfg=00 ctermbg=08'
  elseif cur_mode == "T"
    exe 'hi! myModeColor cterm=bold ctermbg=15 ctermfg=00'
    exe 'hi! myInfoColor ctermbg=00 ctermfg=15'
    exe 'hi! myStatsColor ctermbg=00 ctermfg=15'
    exe 'hi! StatusLine ctermfg=00 ctermbg=08'
  elseif cur_mode == "V" || cur_mode == "VL" || cur_mode == "VB"
    exe 'hi! myModeColor cterm=bold ctermbg=18 ctermfg=00'
    exe 'hi! myInfoColor ctermbg=00 ctermfg=18'
    exe 'hi! myStatsColor ctermbg=00 ctermfg=18'
    exe 'hi! StatusLine ctermfg=00 ctermbg=08'
  endif

  let s:prev_mode = cur_mode
  return cur_mode
endfunction

function! StatusLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no file') : ''
endfunction

function! StatusLinePercent()
  return (100 * line('.') / line('$')) . '%'
endfunction

function! StatusLineLeftInfo()
 let branch = fugitive#head()
 let filename = '' != expand('%:t') ? expand('%:t') : '{no name}'
 if branch !=# ''
   return printf("\ %s\/%s", branch, filename)
 endif
 return filename
endfunction

function! Rbenv()
	return system("rbenv version | awk '{printf $1}'")
endfunction

" More colors
exe 'hi! myFileColor cterm=italic ctermbg=00 ctermfg=08'
exe 'hi! myBufferColor ctermbg=00 ctermfg=08'
exe 'hi! myGlyphsColor ctermbg=00 ctermfg=08'

" start building our statusline
set statusline=

" mode with custom colors
set statusline+=%#myModeColor#\ 
set statusline+=%{StatusLineMode()}\ 
set statusline+=%*

" left information bar (after mode)
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineLeftInfo()}\ %r\ %{PencilMode()}\ 
set statusline+=%*

" filetype
"set statusline+=%#myFileColor#
"set statusline+=\ \[%{StatusLineFiletype()}%R\]
"set statusline+=\ %*

" right section seperator
set statusline+=%=

" percentage, line number and column number
set statusline+=%#myStatsColor#
set statusline+=\ ℓ\ %l/%L\ 𝕔\ %v
"set statusline+=\ %{StatusLinePercent()}
set statusline+=\ %*

" filetype and current register
set statusline+=%#myStatsColor#
set statusline+=\"%{v:register}
"set statusline+=\ ⟢\ %{Rbenv()} "get the rbenv version
set statusline+=\ %*

" buffers
set statusline+=%#myModeColor#
set statusline+=\ %M%n\             "buffer number
set statusline+=%*
"to show format options use %{&fo}
"}}}

" Shadeline Statusline {{{
"let g:shadeline = {}
" let g:shadeline.active = {
"       \   'left':  ['fname', 'flags'],
"       \   'right': ['ruler']
"       \ }
" let g:shadeline.inactive = {
"       \   'left':  ['fname', 'flags']
"       \ }
"}}}

"" Focus {{{
"" Dim inactive windows using 'colorcolumn' setting
"" This tends to slow down redrawing, but is very useful.
"" Based on https://groups.google.com/d/msg/vim_use/IJU-Vk-QLJE/xz4hjPjCRBUJ
"" XXX: this will only work with lines containing text (i.e. not '~')
"" from 
"if exists('+colorcolumn')
"  function! s:DimInactiveWindows()
"    for i in range(1, tabpagewinnr(tabpagenr(), '$'))
"      let l:range = ""
"      if i != winnr()
"        if &wrap
"         " HACK: when wrapping lines is enabled, we use the maximum number
"         " of columns getting highlighted. This might get calculated by
"         " looking for the longest visible line and using a multiple of
"         " winwidth().
"         let l:width=256 " max
"        else
"         let l:width=winwidth(i)
"        endif
"        let l:range = join(range(1, l:width), ',')
"      endif
"      call setwinvar(i, '&colorcolumn', l:range)
"    endfor
"  endfunction
"  augroup DimInactiveWindows
"    au!
"    au WinEnter * call s:DimInactiveWindows()
"    au WinEnter * set cursorline
"    au WinLeave * set nocursorline
"  augroup END
"endif
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

function! MarkdownFoldText()
  let foldsize = (v:foldend-v:foldstart)
  return getline(v:foldstart).' ('.foldsize.' lines)'
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
  colorscheme seoul256
    let g:gitgutter_override_sign_column_highlight = 0
    "Change theme depending on the time of day
    let hr = (strftime('%H'))
    if hr >= 19
    "colorscheme seoul256
    setlocal background=dark
    highlight SignColumn ctermbg=237
    highlight GitGutterAdd ctermbg=237
    highlight GitGutterChange ctermbg=237
    highlight GitGutterDelete ctermbg=237
    highlight GitGutterChangeDelete ctermbg=237
    elseif hr >= 6
    "colorscheme seoul256-light
    setlocal background=light
    highlight SignColumn ctermbg=253
    highlight GitGutterAdd ctermbg=253
    highlight GitGutterChange ctermbg=253
    highlight GitGutterDelete ctermbg=253
    highlight GitGutterChangeDelete ctermbg=253
    elseif hr >= 0
    "colorscheme seoul256
    setlocal background=dark
    highlight SignColumn ctermbg=237
    highlight GitGutterAdd ctermbg=237
    highlight GitGutterChange ctermbg=237
    highlight GitGutterDelete ctermbg=237
    highlight GitGutterChangeDelete ctermbg=237
    endif
    setlocal filetype=markdown
    setlocal textwidth=80
    setlocal showbreak=
    setlocal statusline=%<\ %{StatusLineMode()}\ \|\ %t\ %r%{PencilMode()}\ %=%(\ 𝑤\ %{WordCount()}\ ℓ\ %l/%L\ 𝕔\ %v\ \"%{v:register}\ \|\ %M%n\ %)
    setlocal conceallevel=2
    setlocal spell
    set spellsuggest=15
    let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    let g:markdown_fenced_languages = ['html', 'css', 'bash=sh']
    setlocal nonumber
    setlocal norelativenumber
    setlocal nocursorline
    setlocal colorcolumn=80
    setlocal foldmethod=expr
    setlocal foldexpr=MarkdownFolds()
    "setlocal foldtext=MarkdownFoldText()
    setlocal foldtext=getline(v:foldstart).'\ \[\~'.v:foldlevel.'\:\+'.(v:foldend-v:foldstart).'\]'
    setlocal foldlevel=1
    setlocal foldcolumn=4
    setlocal cpo+=J
    Goyo 85
endfunction

augroup ft_markdown
    au!
    au BufNewFile,BufRead *.md setlocal filetype=markdown
  au BufNewFile,BufRead *.md call DistractionFreeWriting()
  autocmd WinEnter,FocusGained * setlocal nocursorline
  autocmd WinLeave,FocusLost   * setlocal nocursorline
  " Use <localleader>1/2/3 to add headings.
  au Filetype markdown nnoremap <buffer> <localleader>; :Goyo 85<CR>:GitGutterEnable<CR>:set statusline=\ \ \ \ %M%=%{WordCount()}\ <CR>:hi StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE<CR>
  ":GitGutterEnable<CR>
  au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=:redraw<cr>
  au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-:redraw<cr>
  au Filetype markdown nnoremap <buffer> <localleader>3 I###<space><esc>
  au Filetype markdown nnoremap <buffer> <localleader>4 I####<space><esc>
  au Filetype markdown nnoremap <buffer> <localleader>5 I#####<space><esc>
  au Filetype markdown nnoremap <buffer> <localleader>6 I######<space><esc>
  au Filetype markdown nnoremap <buffer> <localleader>` I*<space>*<space>*<space><esc>
  au Filetype markdown inoremap <buffer> <localleader>` * * *
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
"hi CursorLine term=bold cterm=reverse
"hi CursorColumn term=NONE cterm=reverse
"hi Visual term=reverse cterm=reverse
" }}}
" Neovim-Guicursor {{{
set guicursor=n:blinkon0
set guicursor=i-ci-o:ver50-icursor-blinkwait300-blinkon200-blinkoff150
set guicursor=r-cr:hor20-blinkwait300-blinkon200-blinkoff150
	"}}}
"}}}
