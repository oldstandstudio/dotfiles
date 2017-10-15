set nocompatible "sorry vi
filetype off "needed by vundle

" Plugins {{{
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
Plugin 'cocopon/iceberg.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'morhetz/gruvbox'
Plugin 'cocopon/colorswatch.vim'
"Plugin 'cocopon/shadeline.vim'
Plugin 'jnurmine/Zenburn'

" Fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'

" Ag - Silver Searcher
Plugin 'rking/ag.vim'

" File Managers
Plugin 'tpope/vim-vinegar'
Plugin 'cocopon/vaffle.vim'

" Emmet for Vim
Plugin 'mattn/emmet-vim'

" For better html indenting 
Plugin 'indenthtml.vim'

" for haml, sass, and scss support
Plugin 'tpope/vim-haml'

" Support for jade syntax highlighting and indenting
Plugin 'digitaltoad/vim-jade'
au BufNewFile,BufReadPost *.jade set filetype=pug

" Ruby on Rails Plugins
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rbenv'

" Syntastic
Plugin 'vim-syntastic/syntastic'

" Git for vim
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'airblade/vim-gitgutter'

" Markdown / Writting
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'reedes/vim-wordy'
"Plugin 'dpelle/vim-LanguageTool'
"Plugin 'rhysd/vim-grammarous'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Distraction-free writing
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'thinca/vim-zenspace'

" better terminal integration
Plugin 'wincent/terminus'

" Synchronized toggle key mappings
Plugin 'tpope/vim-unimpaired'

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
" }}}
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
nnoremap <leader>l :CtrlPBuffer<CR>
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

"Goyo&Limelight {{{
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
let g:limelight_conceal_ctermfg = 'lightgray'
let g:limelight_conceal_ctermfg = 248

" Default: 0.5
let g:limelight_default_coefficient = 0.5

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

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
"}}}

" Settings for Writting {{{
let g:languagetool_jar  = '/opt/languagetool/languagetool-commandline.jar'

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
"}}}
" Native vim power! Folds and OmniComplete Settings {{{
" OmniComplete {{{
set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
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

"inoremap <tab> <C-p>
map <s-tab> zM
map Q %
map E $
map B 0
map K k

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
nnoremap <leader>` :!<space>
nnoremap <leader>a :Ag!<space>
noremap <silent> <leader>y :<C-u>NextWordy<cr>
noremap <silent> <leader>Y :NoWordy<cr>
"nnoremap <leader>p :TogglePencil<CR>
nnoremap <leader>tgd :colorscheme gruvbox <bar> :set background=dark<CR>
nnoremap <leader>tgl :colorscheme gruvbox <bar> :set background=light<CR>
nnoremap <leader>ti :colorscheme iceberg <bar> :set background=dark<CR>
nnoremap <leader>tz :colorscheme zenburn <bar> :set background=dark<CR>
nnoremap <leader>tsd :colorscheme seoul256 <bar> :set background=dark<CR>
nnoremap <leader>tsi :colorscheme seoul256 <bar> :set background=light<CR>

" create splits
" vertical splits
noremap <leader>v :vsp<CR>
noremap <leader>vf :vsp<space>
noremap <leader>vb :vert sb<space>
noremap <leader>ve :vsp<space>
" horizontal splits
noremap <leader>h :sp<CR>
noremap <leader>hf :sf<space>
noremap <leader>hb :sb<space>
noremap <leader>he :sp<space>

" toggle spell check with
map <leader>s :setlocal spell! spelllang=en_us<cr>
map <localleader>ss z=
" }}}
" map local leader bindings {{{
"inoremap <localleader>; <C-p>
inoremap <localleader>i <C-x><C-o>
inoremap <localleader>p <C-x><C-f>
nnoremap <localleader>e :e<space>
nnoremap <localleader>nh :nohl<CR>
map <localleader>ll >>
map <localleader>hh <<
inoremap <localleader>ll <C-t>
inoremap <localleader>hh <C-d>
nnoremap <localleader>sr :%s/
nnoremap <localleader>sn :w!<bar>mks ~/.vim/sessions/
nnoremap <localleader>sw :mks!<bar>wqa!<CR>
nnoremap <localleader>so :source ~/.vim/sessions/
nnoremap <localleader>mt :Toc<CR>
nnoremap <localleader>mfb :find <C-R>=expand('%:p:h') . '/'<CR>blueprint.md<CR>
nnoremap <localleader>meb :e <C-R>=expand('%:p:h') . '/'<CR>blueprint.md<CR>
nnoremap <localleader>mwi bi*<esc>ea*<esc>
nnoremap <localleader>mwb bi**<esc>ea**<esc>
nnoremap <localleader>mws bi~~<esc>ea~~<esc>
nnoremap <localleader>mli I*<esc>A*<esc>
nnoremap <localleader>mlb I**<esc>A**<esc>
nnoremap <localleader>mls I~~<esc>A~~<esc>
nnoremap <localleader>msi (i*<esc>)hi*<esc>
nnoremap <localleader>msb (i**<esc>)hi**<esc>
nnoremap <localleader>mss (i~~<esc>)hi~~<esc>
nnoremap <localleader>mpi {ji*<esc>}kA*<esc>
nnoremap <localleader>mpb {ji**<esc>}kA**<esc>
nnoremap <localleader>mps {ji~~<esc>}kA~~<esc>
nnoremap <localleader>gg Vgq
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
nnoremap <localleader>h5 :-1read ~/.vim/html/.skeleton.html<CR>4jwf<i
inoremap <localleader>hid <esc>I<div id="<esc>A"><enter><enter></div><esc>kI<tab><tab>
inoremap <localleader>hcl <esc>I<div class="<esc>A"><enter><enter></div><esc>kI<tab><tab>
inoremap <localleader>h. class=""<esc>i
inoremap <localleader>h' id=""<esc>i
"}}}

" CSS {{{
inoremap <localleader>cid <esc>I#<esc>A {<enter><enter>}<esc>kI<tab>
inoremap <localleader>ccl <esc>I.<esc>A {<enter><enter>}<esc>kI<tab>
"}}}

" Ruby {{{
inoremap <localleader>df <esc>Idef <esc>A<enter><enter>end<esc>kI<tab>
inoremap <localleader>rh <esc>I<%=  =><esc>F=hi
"}}}

" Markdown {{{
inoremap <localleader>m3 ### <esc>a
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

" Base16 {{{
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
" }}}

" Only use cursorline for current window {{{
autocmd WinEnter,FocusGained * setlocal cursorline
autocmd WinLeave,FocusLost   * setlocal nocursorline
" }}}

" italic comments {{{
set t_ZH=[3m   "  character is created by ctrl-v <esc>
set t_ZR=[23m
"highlight Comment term=italic cterm=italic gui=italic ctermfg=19
" }}}

" For use with iceberg color theme {{{
"colorscheme iceberg
"set background="dark"
highlight Comment term=italic cterm=italic gui=italic ctermfg=08

"if has('termguicolors')
"	set termguicolors
"endif
" }}}

" Statusline {{{
" based on https://github.com/fatih/dotfiles/blob/master/vimrc

hi! StatusLine ctermfg=00 ctermbg=14

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
    exe 'hi! myModeColor cterm=bold ctermbg=20 ctermfg=00'
		exe 'hi! myInfoColor ctermbg=00 ctermfg=20'
		exe 'hi! myStatsColor ctermbg=00 ctermfg=20'
  elseif cur_mode == "I"
    exe 'hi! myModeColor cterm=bold ctermbg=10 ctermfg=00'
		exe 'hi! myInfoColor ctermbg=00 ctermfg=10'
		exe 'hi! myStatsColor ctermbg=00 ctermfg=10'
  elseif cur_mode == "R"
    exe 'hi! myModeColor cterm=bold ctermbg=12 ctermfg=00'
		exe 'hi! myInfoColor ctermbg=00 ctermfg=12'
		exe 'hi! myStatsColor ctermbg=00 ctermfg=12'
  elseif cur_mode == "T"
    exe 'hi! myModeColor cterm=bold ctermbg=15 ctermfg=00'
		exe 'hi! myInfoColor ctermbg=00 ctermfg=15'
		exe 'hi! myStatsColor ctermbg=00 ctermfg=15'
  elseif cur_mode == "V" || cur_mode == "VL" || cur_mode == "VB"
    exe 'hi! myModeColor cterm=bold ctermbg=18 ctermfg=00'
		exe 'hi! myInfoColor ctermbg=00 ctermfg=18'
		exe 'hi! myStatsColor ctermbg=00 ctermfg=18'
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
" Color theme settings {{{
" seoul256 {{{
let g:seoul256_termguicolors=256
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 234
" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
"let g:seoul256_light_background = 253
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
" zenburn color settings {{{
let g:zenburn_terminalcolors=256
"		}}}
" }}}
" Markdown functions and autocmds {{{
" turn-on distraction free writing mode for markdown files
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn,ghmarkdown} call DistractionFreeWriting()

function! DistractionFreeWriting()
    colorscheme seoul256
		"Change theme depending on the time of day
		let hr = (strftime('%H'))
		if hr >= 19
    "colorscheme seoul256
		set background=dark
		elseif hr >= 6
    "colorscheme seoul256-light
		set background=light
		elseif hr >= 0
    "colorscheme seoul256
		set background=dark
		endif
		set filetype=markdown
		set textwidth=80
		set showbreak=
		set statusline=%<\ %{StatusLineMode()}\ \|\ %t\ %r%{PencilMode()}\ %=%(\ ℓ\ %l/%L\ 𝕔\ %v\ \"%{v:register}\ \|\ %M%n\ %)
		set conceallevel=3
		set spell
		let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
		let g:markdown_fenced_languages = ['html', 'bash=sh']
		set foldmethod=manual
		set nonumber
		set norelativenumber
		Goyo
endfunction
"}}}
" }}}

" reversed highlights {{{
"hi CursorLine term=bold cterm=reverse
"hi CursorColumn term=NONE cterm=reverse
"hi Visual term=reverse cterm=reverse
" }}}
"  }}}
