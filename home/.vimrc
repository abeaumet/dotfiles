" Author: Aymeric Beaumet <aymeric@beaumet.me>
" Github: @aymericbeaumet/dotfiles

if !1 | finish | endif " Skip initialization for vim-tiny or vim-small

if exists('&compatible') | set nocompatible | endif " 21st century

syntax enable
filetype plugin indent on

let mapleader = ' '
let b:vim_directory = expand('~/.vim')
let b:bundle_directory = b:vim_directory . '/bundle'
let b:tmp_directory = b:vim_directory . '/tmp'

" Plugins {{{

  call plug#begin(b:bundle_directory)

    Plug 'tomasr/molokai'

    Plug 'wellle/targets.vim'

    Plug 'Konfekt/FastFold'

    Plug 'Lokaltog/vim-easymotion', { 'on': [ '<Plug>(easymotion-s)' ] }
      let g:EasyMotion_do_mapping = 0 " disable the default mappings
      let g:EasyMotion_keys = 'LPUFYW;QNTESIROA' " Colemak toprow/homerow
      let g:EasyMotion_off_screen_search = 1 " do not search outside of screen
      let g:EasyMotion_smartcase = 1 " like Vim
      let g:EasyMotion_use_smartsign_us = 1 " ! and 1 are treated as the same
      let g:EasyMotion_use_upper = 1 " recognize both upper and lowercase keys

    Plug 'editorconfig/editorconfig-vim'

    Plug 'scrooloose/nerdcommenter'
      let g:NERDCreateDefaultMappings = 0
      let g:NERDCommentWholeLinesInVMode = 1
      let g:NERDMenuMode = 0
      let g:NERDSpaceDelims = 1

    Plug 'tpope/vim-eunuch', { 'on': [ 'Remove', 'Unlink', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Find', 'Locate', 'Wall', 'SudoWrite', 'SudoEdit' ] }

    Plug 'tpope/vim-fugitive'

    Plug 'tpope/vim-repeat'

    Plug 'tpope/vim-surround', { 'on': [ '<Plug>Csurround', '<Plug>Dsurround' ] }
      nmap <silent> cs <Plug>Csurround
      nmap <silent> ds <Plug>Dsurround
      let g:surround_no_mappings = 1 " disable the default mappings
      let g:surround_indent = 1 " reindent with `=` after surrounding

    Plug 'tpope/vim-unimpaired'

    Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'
        let g:airline#extensions#disable_rtp_load = 1
        let g:airline_extensions = [ 'branch', 'tabline' ]
        let g:airline_exclude_preview = 1 " remove airline from preview window
        let g:airline_section_z = '%p%% L%l:C%c' " rearrange percentage/col/line section
        let g:airline_theme = 'badwolf'
        let g:airline_powerline_fonts = 1
        set noshowmode " hide the duplicate mode in bottom status bar

    Plug 'airblade/vim-gitgutter'
      nmap [c <Plug>GitGutterPrevHunk
      nmap ]c <Plug>GitGutterNextHunk
      let g:gitgutter_map_keys = 0
      let g:gitgutter_sign_column_always = 1
      let g:gitgutter_git_executable = 'git'

    Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeCWD' ] }
      let g:NERDTreeShowHidden = 1
      let g:NERDTreeWinSize = 35
      let g:NERDTreeMinimalUI = 1
      let g:NERDTreeAutoDeleteBuffer = 1
      let g:NERDTreeMouseMode = 3
      let g:NERDTreeRespectWildIgnore = 1 " :wildignore

    Plug 'majutsushi/tagbar', { 'on': [ 'TagbarOpen' ] }
      let g:tagbar_width = 35
      let g:tagbar_compact = 1
      let g:tagbar_singleclick = 1
      let g:tagbar_autofocus = 1

    Plug 'benekastah/neomake', { 'for': [ 'go', 'haskell', 'javascript', 'json' ], 'do': '
    \   go get -u github.com/golang/lint/golint;
    \   cabal update && cabal install ghc-mod hdevtools hlint;
    \   npm install --global eslint;
    \   npm install --global jsonlint;
    \ ' }
      augroup config_neomake
        autocmd!
        autocmd FileType go,haskell,javascript,json autocmd! config_neomake BufEnter,BufWritePost * Neomake
      augroup END
      let g:neomake_go_enabled_makers = [ 'go', 'golint', 'govet' ]
      let g:neomake_haskell_enabled_makers = [ 'ghcmod', 'hdevtools', 'hlint' ]
      let g:neomake_javascript_enabled_makers = [ 'eslint' ]
      let g:neomake_json_enabled_makers = [ 'jsonlint' ]
      let g:neomake_verbose = 0

    Plug 'vim-scripts/BufOnly.vim', { 'on': [ 'BufOnly' ] }

    Plug 'haya14busa/vim-asterisk', { 'on': [ '<Plug>(asterisk-*)', '<Plug>(asterisk-#)' ] }
      map * <Plug>(asterisk-*)
      map # <Plug>(asterisk-#)
      let g:asterisk#keeppos = 1

    Plug 'dietsche/vim-lastplace'

    Plug 'Shougo/vimproc.vim', { 'do': 'make' }

    Plug 'Shougo/vimshell', { 'on': [ 'VimShellCurrentDir', 'VimShellInteractive' ] }
      let g:vimshell_prompt = '$ '

    " Unite sources
    Plug 'Shougo/neomru.vim'
    Plug 'Shougo/neoyank.vim'
    Plug 'Shougo/unite-help'
    Plug 'Shougo/unite-outline'
    Plug 'aymericbeaumet/unite-alternate'
    Plug 'aymericbeaumet/unite-z'

    Plug 'Shougo/unite.vim'
      let g:unite_source_menu_menus = get(g:, 'unite_source_menu_menus', {})
      let g:unite_source_menu_menus.shell = {
      \   'command_candidates': [
      \     [ '[git] blame', 'Gblame' ],
      \     [ '[git] status', 'Gstatus' ],
      \
      \     [ '[haskell] REPL', 'VimShellInteractive ghci' ],
      \
      \     [ '[nodejs] REPL', 'VimShellInteractive node' ],
      \
      \     [ '[vim] edit configuration', 'edit $MYVIMRC' ],
      \     [ '[vim] source configuration', 'source $MYVIMRC' ],
      \     [ '[vim] clean plugins', 'PlugClean' ],
      \     [ '[vim] install plugins', 'PlugInstall' ],
      \     [ '[vim] update plugins', 'PlugUpdate' ],
      \     [ '[vim] kill all buffers', 'bufdo bdelete!' ],
      \     [ '[vim] only keep this buffer', 'BufOnly!' ],
      \
      \     [ '[shell] cwd', 'VimShellCurrentDir -buffer-name=shell -split' ],
      \   ]
      \ }
      augroup config_unite
        autocmd!
        autocmd FileType unite call s:on_unite_buffer()
      augroup END
      function! s:on_unite_buffer()
        imap <silent><buffer> <C-b> <Plug>(unite_move_left)
        imap <silent><buffer> <C-f> <Plug>(unite_move_right)
        imap <silent><buffer> <ESC> <Plug>(unite_exit)
        nmap <silent><buffer> <ESC> <Plug>(unite_exit)
      endfunction

    "  ```sh
    "  pip2 install --upgrade neovim
    "  pip3 install --upgrade neovim
    "  ```
    if has('nvim') && has('python3')
      Plug 'Shougo/neosnippet.vim'
        let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
        let g:neosnippet#snippets_directory = b:vim_directory . '/snippets'
        if has('conceal') | set conceallevel=2 concealcursor=niv | endif

      function! AfterDeoplete()
        UpdateRemotePlugins
      endfunction
      Plug 'Shougo/deoplete.nvim', { 'do': function('AfterDeoplete') }
        let g:deoplete#enable_at_startup = 1
        let g:deoplete#max_abbr_width = 0
        let g:deoplete#max_menu_width = 0
        let g:deoplete#file#enable_buffer_path = 1
        set completeopt=menuone,noinsert

      Plug 'zchee/deoplete-go', { 'do': 'go get -u github.com/nsf/gocode ; make'}

      Plug 'eagletmt/neco-ghc', { 'do': 'cabal update && cabal install ghc-mod' }
        let g:haskellmode_completion_ghc = 0 " disable haskell-vim omnifunc

      Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install --global tern' }

      " redefine some mappings for a better integration with deoplete/neosnippet:
      " - Tab inserts the snippet if recognized, otherwise inserts the completion if
      "   the pum is visible, otherwise insert a tab
      " - Enter always cancels the pum and goes to the next line
      imap <silent><expr> <TAB>
      \ neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand)" :
      \ pumvisible() ?
      \ "\<C-y>" :
      \ neosnippet#jumpable() ?
      \ "\<Plug>(neosnippet_jump)" :
      \ "\<TAB>"
      imap <silent><expr> <CR>
      \ pumvisible() ?
      \ "\<C-e><CR>" :
      \ "\<CR>"
    endif

    Plug 'pangloss/vim-javascript'
      let javascript_enable_domhtmlcss = 1 " enable HTML/CSS highlighting

    Plug 'elzr/vim-json'

    Plug 'neovimhaskell/haskell-vim'
      let g:haskell_enable_quantification = 1
      let g:haskell_enable_recursivedo = 1
      let g:haskell_enable_arrowsyntax = 1
      let g:haskell_enable_pattern_synonyms = 1
      let g:haskell_enable_typeroles = 1
      let g:haskell_enable_static_pointers = 1

  call plug#end()

" }}}

" Plugins (after loading) {{{

  " Shougo/unite.vim
    call unite#custom#profile('default', 'context', { 'start_insert': 1, 'wipe': 1 })
    call unite#custom#source('file_rec/async,grep', 'ignore_pattern', 'bower_components/\|coverage/\|docs/\|node_modules/\|tmp/')
    call unite#custom#source('file_rec/async,grep,file_rec/git,grep/git,buffer', 'matchers', [ 'matcher_fuzzy', 'matcher_hide_current_file' ])
    call unite#filters#sorter_default#use([ 'sorter_rank' ])

" }}}

" Inlined plugins {{{

  augroup config_inlined_plugins
    autocmd!
    " highlight search matches (except while being in insert mode)
    autocmd VimEnter,InsertLeave * setl hlsearch
    autocmd InsertEnter * setl nohlsearch
    " highlight cursor line (except while being in insert mode)
    autocmd VimEnter,InsertLeave * setl cursorline
    autocmd InsertEnter * setl nocursorline
    " automatically remove trailing whitespace when saving
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END

" }}}

" Enhanced mappings {{{

  " better `j` and `k`
  nnoremap <silent> j gj
  vnoremap <silent> j gj
  nnoremap <silent> k gk
  vnoremap <silent> k gk

  " copy from the cursor to the end of line using Y (matches D behavior)
  nnoremap <silent> Y y$

  " keep the cursor in place while joining lines
  nnoremap <silent> J mZJ`Z

  " disable annoying mappings
  noremap  <silent> <C-c>  <Nop>
  noremap  <silent> <C-w>f <Nop>
  noremap  <silent> <Del>  <Nop>
  noremap  <silent> <F1>   <Nop>
  noremap  <silent> q:     <Nop>

  " reselect visual block after indent
  vnoremap <silent> < <gv
  vnoremap <silent> > >gv

  " clean screen and reload file
  nnoremap <silent> <C-l>      :<C-u>nohl<CR>:redraw<CR>:checktime<CR><C-l>
  xnoremap <silent> <C-l> <C-c>:<C-u>nohl<CR>:redraw<CR>:checktime<CR><C-l>gv

  " some emacs mappings in insert mode
  inoremap <silent> <C-b> <C-\><C-o>h
  inoremap <silent> <C-f> <C-\><C-o>l
  inoremap <silent> <M-b> <C-\><C-o>b
  inoremap <silent> <M-f> <C-c>ea
  inoremap <silent> <C-h> <BS>
  inoremap <silent> <C-d> <Del>
  inoremap <silent> <C-w> <C-\><C-o>"_db
  inoremap <silent> <M-d> <C-\><C-o>"_de
  inoremap <silent> <C-a> <C-\><C-o>^
  inoremap <silent> <C-e> <C-\><C-o>$

" }}}

" Leader mappings {{{

  " TODO: [a]lternate between source and test files

  " [b]uffer search
  nnoremap <silent> <Leader>b :<C-u>Unite -auto-preview -vertical-preview -no-split buffer<CR>

  " [c]omment toggling for the current line / selection
  nmap     <silent> <Leader>c <Plug>NERDCommenterToggle
  xmap     <silent> <Leader>c <Plug>NERDCommenterToggle

  " [d]elete the current buffer
  nnoremap <silent> <Leader>d :<C-u>bdelete!<CR>

  " [e]xplore filesystem
  nnoremap <silent> <Leader>e :<C-u>NERDTreeCWD<CR>

  " [f]ind files in the current working directory
  nnoremap <silent> <Leader>f :<C-u>Unite -auto-preview -vertical-preview -no-split file_rec/async<CR>

  " [F]ind files in the current git project
  nnoremap <silent> <Leader>F :<C-u>Unite -auto-preview -vertical-preview -no-split file_rec/git:--cached<CR>

  " [g]rep files in the current working directory
  nnoremap <silent> <Leader>g :<C-u>Unite -auto-preview -vertical-preview -no-split grep<CR>

  " [G]rep files in the current git project
  nnoremap <silent> <Leader>G :<C-u>Unite -auto-preview -vertical-preview -no-split grep/git:--cached<CR>

  " [h]elp search
  nnoremap <silent> <Leader>h :<C-u>Unite -auto-preview -vertical-preview -no-split help<CR>

  " [m]enu
  nnoremap <silent> <Leader>m :<C-u>Unite -direction=botright menu:shell<CR>

  " [o]utline navigation in file
  nnoremap <silent> <Leader>o :<C-u>Unite -direction=botright outline<CR>

  " [p]aste with yank history (support past before and after)
  nnoremap <silent> <Leader>P :<C-u>Unite -no-split history/yank -default-action=insert<CR>
  nnoremap <silent> <Leader>p :<C-u>Unite -no-split history/yank -default-action=append<CR>

  " [q]uit the current window
  nnoremap <silent> <Leader>q :<C-u>quit!<CR>

  " [r]ecent files search
  nnoremap <silent> <Leader>r :<C-u>Unite -auto-preview -vertical-preview -no-split file_mru<CR>

  " [s]earch in the current buffer
  nmap     <silent> <Leader>s <Plug>(easymotion-s)
  xmap     <silent> <Leader>s <Plug>(easymotion-s)
  omap     <silent> <Leader>s <Plug>(easymotion-s)

  " [t]ags explorer
  nnoremap <silent> <Leader>t :<C-u>TagbarOpen fj<CR>

  " [w]rite the current buffer
  nnoremap <silent> <Leader>w :<C-u>write!<CR>

  " TODO: [z] recent directories search (rely on https://github.com/rupa/z)
  " nnoremap <silent> <Leader>z :<C-u>Unite -no-split z<CR>

" }}}

" Settings {{{

  " buffer
  set autoread " watch for file changes by other programs
  set autowrite " automatically save before :next and :make
  set hidden " when a tab is closed, do not delete the buffer

  " cursor
  set nostartofline " leave my cursor alone
  set scrolloff=8 " keep at least 8 lines after the cursor when scrolling
  set sidescrolloff=10 " (same as `scrolloff` about columns during side scrolling)
  set virtualedit=block " allow the cursor to go in to virtual places

  " command
  set history=1000 " increase history size

  " encoding
  if has('vim_starting') | set encoding=utf-8 | endif " ensure proper encoding
  set fileencodings=utf-8 " ensure proper encoding

  " error handling
  set noerrorbells " turn off error bells
  set visualbell t_vb= " turn off error bells

  " folding
  set nofoldenable
  set foldmethod=marker
  set foldlevelstart=99

  " indentation
  set autoindent " auto-indentation
  set backspace=2 " fix backspace (on some OS/terminals)
  set expandtab " replace tabs by spaces
  set shiftwidth=2 " n spaces when using <TAB>
  set smarttab " insert `shiftwidth` spaces instead of tabs
  set softtabstop=2 " n spaces when using <TAB>
  set tabstop=2 " n spaces when using <TAB>

  " interface
  let g:netrw_dirhistmax = 0 " disable netrw
  set fillchars="" " remove split separators
  set formatoptions=croqj " format option stuff (see :help fo-table)
  set laststatus=2 " always display status line
  set shortmess=aoOsI " disable vim welcome message / enable shorter messages
  set showcmd " show (partial) command in the last line of the screen
  set splitbelow " slit below
  set splitright " split right
  set textwidth=80 " 80 characters line

  " mappings
  set timeoutlen=500 " time to wait when a part of a mapped sequence is typed
  set ttimeoutlen=0 " instant insert mode exit using escape

  " modeline
  set modeline " enable modelines for per file configuration
  set modelines=1 " consider the first/last lines

  " mouse
  if has('mouse')
    set mouse=a
    if exists('&ttyscroll') | set ttyscroll=3 | endif
    if exists('&ttymouse') | set ttymouse=xterm2 | endif
  endif

  " performance
  set lazyredraw " only redraw when needed
  if exists('&ttyfast') | set ttyfast | endif " we have a fast terminal

  " search and replace
  set gdefault " default substitute g flag
  set ignorecase " ignore case when searching
  set incsearch " show matches as soon as possible
  set smartcase " smarter search case
  set wildignore= " remove default ignores
  set wildignore+=*.o,*.obj,*.so,*.a,*.dylib,*.pyc,*.hi " ignore compiled files
  set wildignore+=*.zip,*.gz,*.xz,*.tar,*.rar " ignore compressed files
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " ignore SCM files
  set wildignore+=*.png,*.jpg,*.jpeg,*.gif " ignore image files
  set wildignore+=*.pdf,*.dmg " ignore binary files
  set wildignore+=.*.sw*,*~ " ignore editor files
  set wildignore+=.DS_Store " ignore OS files
  set wildmenu " better command line completion menu
  set wildmode=full " ensure better completion

  " system
  set shell=zsh\ -l

  " theme
  colorscheme molokai
  set background=dark
  set colorcolumn=+1 " relative to text-width
  set t_Co=256 " 256 colors

  " undo
  if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
    let &undodir = b:tmp_directory . '/undo//'
  endif

  " vim
  let &viminfo = &viminfo + ',n' . b:tmp_directory . '/info//' " change viminfo file path
  set nobackup " disable backup files
  set noswapfile " disable swap files
  set secure " protect the configuration files

" }}}

" GUI settings {{{

  " MacVim (https://github.com/macvim-dev/macvim)
  " - disable antialiasing with `!defaults write org.vim.MacVim AppleFontSmoothing -int 0`
  if has('gui_macvim')
    " Set the font
    silent! set guifont=Monaco:h13 " fallback
    silent! set guifont=Hack:h13 " preferred
    " Enable <M-...> mappings
    set macmeta
    " Disable superfluous GUI stuff
    set guicursor=
    set guioptions=
    " Use console dialog instead of popup
    set guioptions+=c
    " Disable cursor blinking
    set guicursor+=a:blinkon0
    " Set the cursor as an underscore
    set guicursor+=a:hor8
  endif

  " Neovim.app (https://github.com/neovim/neovim)
  " - disable antialiasing with `!defaults write uk.foon.Neovim AppleFontSmoothing -int 0`
  if exists('neovim_dot_app')
    " Set the font
    silent! call MacSetFont('Monaco', '13') " fallback
    silent! call MacSetFont('Hack', '13') " preferred
    " Enable <M-...> mappings
    call MacSetOptionAsMeta(1)
    " Enable anti-aliasing (see above to disable the ugly AA from OSX)
    call MacSetFontShouldAntialias(1)
  endif

  " }}}
