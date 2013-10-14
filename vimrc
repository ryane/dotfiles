set nocompatible                  " Must come first because it changes other options.
filetype off                      " required! (for vundle)

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle
" required!
Bundle 'gmarik/vundle'

" my bundles
Bundle "jeffkreeftmeijer/vim-numbertoggle"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-markdown"
Bundle "nelstrom/vim-markdown-folding"

Bundle "mileszs/ack.vim"
Bundle "kien/ctrlp.vim"
Bundle "scrooloose/nerdtree"
Bundle "ZoomWin"
Bundle "Lokaltog/vim-powerline"
Bundle "kana/vim-textobj-user"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "benmills/vimux"
Bundle "nanotech/jellybeans.vim"
Bundle "tComment"
Bundle "pangloss/vim-javascript"
Bundle "kchmck/vim-coffee-script"
Bundle "majutsushi/tagbar"
Bundle "nono/vim-handlebars"
Bundle "airblade/vim-gitgutter"

Bundle "ryane/snipmate-snippets"
Bundle "msanders/snipmate.vim"

" testing...
Bundle "jiangmiao/auto-pairs"
Bundle "Shougo/neocomplcache"
Bundle "tpope/vim-obsession"
Bundle "tpope/vim-dispatch"
Bundle "vim-ruby/vim-ruby"
Bundle "jgdavey/tslime.vim"
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"
Bundle "wikitopian/hardmode"
Bundle "tpope/vim-abolish"
Bundle "davidoc/taskpaper.vim"
Bundle "christoomey/vim-tmux-navigator"

filetype plugin indent on         " Turn on file type detection.
syntax enable                     " Turn on syntax highlighting.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" whitespace settings
set list                          " Show invisible characters

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

if has("win32")
  set encoding=utf-8
  set guifont=Consolas\ for\ Powerline\ FixedD:h11
  colorscheme jellybeans
  set guioptions-=m
  set guioptions-=r
else
  " font
  set guifont=Menlo\ for\ Powerline:h14
  colorscheme Tomorrow-Night
endif

if has('gui_running')
  set guioptions-=T           " remove the toolbar
  "set lines=40                " 40 lines of text instead of 24,
endif

" use custom snipmate directory
let g:snippets_dir="$HOME/.vim/bundle/snipmate-snippets/snippets"

" use comma (,) for leader
let mapleader = ","

" fancy powerline
let g:Powerline_symbols = 'fancy'

" prevent esc delays
" http://ksjoberg.com/vim-esckeys.html
set noesckeys

" write the file when switching buffers
set autowrite

" don't use ESC so much
inoremap jk <esc>

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif"`'")"'")"

" open quickfix window after any grep invocation
" https://github.com/tpope/vim-fugitive (see FAQ)
autocmd QuickFixCmdPost *grep* cwindow

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=

" better window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|log$\|coverage\/rcov\|tmp$',
  \ 'file': '\.log$'
  \ }
let g:ctrlp_jump_to_buffer = 0

" switch between files even more easily
nnoremap <leader><leader> <c-^>

" improve buffer switching
nmap <leader>F :CtrlPMRU<CR>
nmap <leader>b :CtrlPBuffer<CR>

" navigate tags
nmap <leader>g :CtrlPBufTag<CR>

" fugitive mappings
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR><C-w>10+
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gr :Gread<CR>

" Close any corresponding diff buffer
function! MyCloseDiff()
  if (&diff == 0 || getbufvar('#', '&diff') == 0)
        \ && (bufname('%') !~ '^fugitive:' && bufname('#') !~ '^fugitive:')
    echom "Not in diff view."
    return
  endif

  " close current buffer if alternate is not fugitive but current one is
  if bufname('#') !~ '^fugitive:' && bufname('%') =~ '^fugitive:'
    if bufwinnr("#") == -1
      b #
      bd #
    else
      bd
    endif
  else
    bd #
  endif
endfunction
nnoremap <Leader>gD :call MyCloseDiff()<cr>

" nerdtree
map <leader>n :NERDTreeToggle<CR>

" tagbar
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nmap <leader>T :TagbarToggle<CR>

" Ack
let g:ackprg = 'ag --nogroup --nocolor --column'
map <leader>f :Ack<space>

" remove search highlighting
map <leader>x :nohl<CR>

au BufNewFile,BufRead *.hbars set ft=handlebars
au BufNewFile,BufRead *.hbs.erb set ft=handlebars
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.js.erb set ft=javascript

" Clear the search buffer when hitting return
" function! MapCR()
"   nnoremap <cr> :nohlsearch<cr>
" endfunction
" call MapCR()

" handle clipboard more easily
map <leader>y "*y
map <leader>p "*p

" misc functions

" clean up whitespace
" http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

"automatically clear trailing whitespace
autocmd FileType c,cpp,python,ruby,java,javascript,css autocmd BufWritePre <buffer> :%s/\s\+$//e

function! ReformatDocument()
  execute ':call Preserve("%s/\\s\\+$//e")'
  execute ':call Preserve("normal gg=G")'
  execute ':w'
  execute ':bn'
endfunction
nmap <leader>fed :call ReformatDocument()<CR>

function! FixMixedDosEncoding()
  execute ':e ++ff=dos'
  execute ':setlocal ff=unix'
  execute ':w'
endfunction
nmap <leader>fee :call FixMixedDosEncoding()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
" modified from https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('spec')<cr>

function! GetBundledRspecCommand()
  if glob(".zeus.sock") != ""
    let t:bundled_rspec_run_command = ":!zeus rspec "
  else
    let t:bundled_rspec_run_command = ":!bundle exec rspec "
  endif
endfunction

if !exists("t:bundled_rspec_run_command")
  call GetBundledRspecCommand()
end

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:rae_test_file")
    return
  end
  call RunTests(t:rae_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:rae_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
  if match(a:filename, '\.feature$') != -1
    exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif filereadable("Gemfile")
      exec t:bundled_rspec_run_command . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

" tslime
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars

" neocompletecache
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" end neocompletecache
"
"
" temporary mamajamas saved macro
"
let @m='0f,a jkf,a jkf,D0vt,S"f,wvt,S"0v$hS{jkA,jk0f"iname: jkf,f"ibuy_before: jkf,wi:kbpriority: jk==jkj'
