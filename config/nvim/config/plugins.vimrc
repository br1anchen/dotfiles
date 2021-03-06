" Themes {{{
" =============================================================================

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

" Theme
syntax enable
" colorscheme OceanicNext
colorscheme nova
highlight CursorLineNr guifg=#f2c38f

set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete:h13
" let g:airline_theme='oceanicnext'

" }}}

" vim-airline {{{
" =============================================================================

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#mike#enabled = 0
set hidden
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#neomake#error_symbol='✗'
" let g:airline#extensions#neomake#warning_symbol='⚠ '
let g:airline_symbols.branch = ''
let g:airline_theme='oceanicnext'

tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#buffer_idx_format = {
            \ '0': '0 ',
            \ '1': '1 ',
            \ '2': '2 ',
            \ '3': '3 ',
            \ '4': '4 ',
            \ '5': '5 ',
            \ '6': '6 ',
            \ '7': '7 ',
            \ '8': '8 ',
            \ '9': '9 ',
            \}

"}}}

" vim-devicons {{{
" =============================================================================

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''

" }}}

" ervandew/supertab {{{
" =============================================================================

let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" }}}

" neomake {{{
" =============================================================================

" let g:neomake_highlight_lines = 1

" autocmd! BufWritePost * Neomake

let g:neomake_typescript_tsc_maker = {
            \ 'append_file': 0,
            \ 'args': ['--project', getcwd() . '/tsconfig.json', '--noEmit'],
            \ 'errorformat': '%f(%l\,%c): %m'
            \}

let g:neomake_typescript_tslint_maker = {
            \ 'args': ['--fix'],
            \ 'errorformat': 'ERROR: %f[%l\, %c]: %m',
            \}

let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']

autocmd BufWritePost * call neomake#Make(1, [], function('s:Neomake_callback'))

" Callback for reloading file in buffer when eslint has finished and maybe has
" autofixed some stuff
function! s:Neomake_callback(options)
    checktime
endfunction

" }}}

" Smooth scroll {{{
" =============================================================================

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 12, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 14, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 22, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 24, 4)<CR>

" }}}

" vim-expand-region {{{
" =============================================================================

map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" }}}

" vim-better-whitespace {{{
" =============================================================================

autocmd BufEnter * EnableStripWhitespaceOnSave

" }}}

" NERDTree {{{
" =============================================================================

map <silent> - :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1

" let g:webdevicons_enable_nerdtree = 0
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
" let g:NERDTreeFileExtensionHighlightFullName = 1

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''

" }}}

" Lokaltog/vim-easymotion {{{
" =============================================================================
map f <Plug>(easymotion-prefix)
map ff <Plug>(easymotion-s)
map fs <Plug>(easymotion-f)
map fl <Plug>(easymotion-lineforward)
map fj <Plug>(easymotion-j)
map fk <Plug>(easymotion-k)
map fh <Plug>(easymotion-linebackward)

let g:EasyMotion_smartcase = 1
" }}}

" Denite {{{
" =============================================================================

let g:webdevicons_enable_denite = 0
let s:menus = {}

call denite#custom#option('_', {
            \ 'prompt': '❯',
            \ 'winheight': 10,
            \ 'reversed': 1,
            \ 'highlight_matched_char': 'Underlined',
            \ 'highlight_mode_normal': 'CursorLine',
            \ 'updatetime': 1,
            \ 'auto_resize': 1,
            \})
call denite#custom#option('TSDocumentSymbol', {
            \ 'prompt': ' @' ,
            \ 'reversed': 0,
            \})
call denite#custom#var('file_rec', 'command',['rg', '--files', '--glob', '!.git'])
" call denite#custom#source('file_rec', 'vars', {
"       \ 'command': [
"       \ 'ag', '--follow','--nogroup','--hidden', '--column', '-g', '', '--ignore', '.git', '--ignore', '*.png'
"       \] })
call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
call denite#custom#source('grep', 'matchers', ['matcher_regexp'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',['--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <silent> <c-p> :DeniteProjectDir file_rec<CR>
nnoremap <silent> <leader>h :Denite  help<CR>
nnoremap <silent> <leader>c :Denite colorscheme<CR>
nnoremap <silent> <leader>b :Denite buffer<CR>
nnoremap <silent> <leader>a :Denite grep:::!<CR>
call denite#custom#map('insert','<C-n>','<denite:move_to_next_line>','noremap')
call denite#custom#map('insert','<C-p>','<denite:move_to_previous_line>','noremap')
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
call denite#custom#var('menu', 'menus', s:menus)

" }}}

" chemzqm/denite-extra {{{
" =============================================================================

nnoremap <leader>node :<C-u>Denite node:search<CR>

" }}}

" christoomey/vim-tmux-navigator {{{
" =============================================================================
if exists('$TMUX')
    function! TmuxOrSplitSwitch(wincmd, tmuxdir)
        let previous_winnr = winnr()
        silent! execute "wincmd " . a:wincmd
        if previous_winnr == winnr()
            call system("tmux select-pane -" . a:tmuxdir)
            redraw!
        endif
    endfunction

    let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
    let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
    let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

    nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
    nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
    nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
    nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
endif
" }}}

" Git from denite {{{
" =============================================================================
let s:menus.git = {
            \ 'description' : 'Fugitive interface',
            \}
let s:menus.git.command_candidates = [
            \[' git status', 'Gstatus'],
            \[' git diff', 'Gvdiff'],
            \[' git commit', 'Gcommit'],
            \[' git stage/add', 'Gwrite'],
            \[' git checkout', 'Gread'],
            \[' git rm', 'Gremove'],
            \[' git cd', 'Gcd'],
            \[' git push', 'exe "Git! push " input("remote/branch: ")'],
            \[' git pull', 'exe "Git! pull " input("remote/branch: ")'],
            \[' git pull rebase', 'exe "Git! pull --rebase " input("branch: ")'],
            \[' git checkout branch', 'exe "Git! checkout " input("branch: ")'],
            \[' git fetch', 'Gfetch'],
            \[' git merge', 'Gmerge'],
            \[' git browse', 'Gbrowse'],
            \[' git head', 'Gedit HEAD^'],
            \[' git parent', 'edit %:h'],
            \[' git log commit buffers', 'Glog --'],
            \[' git log current file', 'Glog -- %'],
            \[' git log last n commits', 'exe "Glog -" input("num: ")'],
            \[' git log first n commits', 'exe "Glog --reverse -" input("num: ")'],
            \[' git log until date', 'exe "Glog --until=" input("day: ")'],
            \[' git log grep commits',  'exe "Glog --grep= " input("string: ")'],
            \[' git log pickaxe',  'exe "Glog -S" input("string: ")'],
            \[' git index', 'exe "Gedit " input("branchname\:filename: ")'],
            \[' git mv', 'exe "Gmove " input("destination: ")'],
            \[' git grep',  'exe "Ggrep " input("string: ")'],
            \[' git prompt', 'exe "Git! " input("command: ")'],
            \] " Append ' --' after log to get commit info commit buffers

nnoremap <silent> <leader>git :Denite menu:git<CR>

" }}}

" tpope/vim-fugitive {{{
" =============================================================================

nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>

" }}}

" chemzqm/denite-git {{{
" =============================================================================
call denite#custom#map(
            \ 'normal',
            \ 'a',
            \ '<denite:do_action:add>',
            \ 'noremap'
            \)

call denite#custom#map(
            \ 'normal',
            \ 'd',
            \ '<denite:do_action:delete>',
            \ 'noremap'
            \)

call denite#custom#map(
            \ 'normal',
            \ 'r',
            \ '<denite:do_action:reset>',
            \ 'noremap'
            \)

" nnoremap <silent> <leader>gs :Denite gitstatus<CR>
nnoremap <silent> <leader>gl :Denite gitlog<CR>
nnoremap <silent> <leader>gla :Denite gitlog:all<CR>
" }}}

" lambdalisue/vim-gita {{{
" =============================================================================
"
let g:gita#suppress_warning = 1

nnoremap <silent> <leader>gs :Gita status<CR>
augroup mygita
    autocmd!
    autocmd FileType gita-commit nmap cc <Plug>(gita-status-open)
    autocmd FileType gita-status nmap cc <Plug>(gita-commit-open)
augroup END

" }}}

" deoplete {{{
" =============================================================================

" enable deoplete
let g:deoplete#enable_at_startup = 1
let g:echodoc_enable_at_startup=1
set splitbelow
set completeopt+=noselect
set completeopt-=preview
autocmd CompleteDone * pclose

function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

let g:deoplete#file#enable_buffer_path=1

call deoplete#custom#set('buffer', 'mark', 'ℬ')
call deoplete#custom#set('ternjs', 'mark', '')
call deoplete#custom#set('omni', 'mark', '⌾')
call deoplete#custom#set('file', 'mark', 'file')
call deoplete#custom#set('jedi', 'mark', '')
call deoplete#custom#set('typescript', 'mark', '')
call deoplete#custom#set('neosnippet', 'mark', '')

call deoplete#custom#set('typescript',  'rank', 630)
function! Preview_func()
    if &pvw
        setlocal nonumber norelativenumber
    endif
endfunction
autocmd WinEnter * call Preview_func()
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['around']
"
" }}}

" deoplete-ternjs {{{
" =============================================================================

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 1
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filetypes = [
  \ 'js',
  \ 'javascript',
  \ 'vue',
  \ 'jsx',
  \ 'javascript.jsx'
\ ]

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" }}}

" UltiSnip {{{
" =============================================================================
" <tab> => expand the snippets
let g:UltiSnipsExpandTrigger = '<tab>'
" <leader>ls => list available snippets start with the chars before the cursor
let g:UltiSnipsListSnippets = '<leader>ls'
let g:UltiSnipsJumpForwardTrigger = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
" }}}

" Git {{{
" =============================================================================
set signcolumn=yes

" }}}

" Ale (async linting) {{{
" =============================================================================

let g:ale_linters = {}
let g:ale_linters.javascript = ['eslint', 'flow']
let g:ale_linters.python = ['pylint']
let g:ale_linters.haskell = ['stack-ghc-mod', 'hlint']

nmap <silent> <C-k> <Plug>(ale_previous)
nmap <silent> <C-j> <Plug>(ale_next)

let g:ale_sign_error = '✗'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F
let g:ale_statusline_format = ['✗ %d', '⚠ %d', '']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1
let g:ale_emit_conflict_warnings = 0

" Typescript
" let g:ale_typescript_tslint_args = '--fix'
" }}}

" syntastic {{{
" =============================================================================
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_aggregate_errors = 1
" let g:syntastic_sort_aggregated_errors = 0
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
" let g:syntastic_check_on_open = 1
" let g:syntastic_mode_map = {
" \ 'mode': 'passive',
" \ 'active_filetypes': ['typescript'],
" \ 'passive_filetypes': [] }
"
" map <leader>cc :SyntasticCheck<CR>
" map <leader>ct :SyntasticToggle<CR>
" map <leader>cr :SyntasticReset<CR>
" map <leader>ce :Error<CR>
" map <leader>cj :lnext<CR>
" map <leader>ck :lprevious<CR>
" nnoremap <silent> <F6> :SyntasticCheck<CR>
"
" " Python
" let g:syntastic_python_checkers = ['python', 'pylint']
" let g:syntastic_python_pylint_post_args = '--max-line-length=99 -d C0111,I0011,R0801'
"
" " Typescript
" let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
" let g:syntastic_typescript_tslint_args = "--fix"

" }}}

" Navigate between vim buffers and tmux panels {{{
" =============================================================================

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>
tmap <C-j> <C-\><C-n>:TmuxNavigateDown<cr>
tmap <C-k> <C-\><C-n>:TmuxNavigateUp<cr>
tmap <C-l> <C-\><C-n>:TmuxNavigateRight<cr>
tmap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tmap <C-;> <C-\><C-n>:TmuxNavigatePrevious<cr>

"}}}

" vim-test {{{
" =============================================================================

let g:test#python#runner = 'pytest'
nmap <silent> <leader>tn :w<CR>:TestNearest<CR>
nmap <silent> <leader>tf :w<CR>:TestFile<CR>
nmap <silent> <leader>ta :w<CR>:TestSuite<CR>
nmap <silent> <leader>tl :w<CR>:TestLast<CR>
nmap <silent> <leader>tg :w<CR>:TestVisit<CR>

" }}}

" Jedi {{{
" =============================================================================

let g:jedi#goto_command = "<leader>gd"
let g:jedi#goto_assignments_command = "<leader>gg"
let g:jedi#documentation_command = "<leader>gk"
let g:jedi#usages_command = "<leader>gn"
let g:jedi#rename_command = "<leader>gr"
let g:jedi#completions_enabled = 0

let g:pymode_rope = 0

" }}}

" python-mode/python-mode {{{
" =============================================================================
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_python = 'python3'

let g:pymode_indent = 1
" }}}

" javascript-libraries-syntax.vim {{{
" =============================================================================

let g:used_javascript_libs = 'underscore,angularjs,react,vue,chai,jasmine'

" }}}

" Quramy/tsuquyomi {{{
" =============================================================================

" let g:tsuquyomi_disable_quickfix = 1
" augroup ts
"   autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
"   autocmd FileType typescript nmap Ti <Plug>(TsuquyomiImport)
"   autocmd FileType typescript nmap Td <Plug>(TsuquyomiDefinition)
"   autocmd FileType typescript nmap Tr <Plug>(TsuquyomiReferences)
" augroup end
"
" map <silent> <leader>ti :TsuquyomiImport <cr>
" map <silent> <Leader>th : <C-u>echo tsuquyomi#hint()<CR>

" }}}

" mhartington/nvim-typescript {{{
" =============================================================================

augroup nvimTypescriptMaps
  au!

    au FileType typescript nmap <leader>td :TSDoc <cr>
    au FileType typescript nmap <leader>tt :TSType <cr>
    au FileType typescript nmap <leader>gd :TSDef <cr>
    au FileType typescript nmap <leader>gp :TSDefPreview <cr>
    au FileType typescript nmap <leader>tr :TSRefs <cr>
    au FileType typescript nmap <leader>ti :TSImport <cr>
    au FileType typescript nmap <leader>@ :Denite -buffer-name=TSDocumentSymbol TSDocumentSymbol <cr>
    " au FileType typescript setl omnifunc=TSComplete

augroup END

let g:nvim_typescript#kind_symbols = {
            \ 'keyword': 'keyword',
            \ 'class': '',
            \ 'interface': 'interface',
            \ 'script': 'script',
            \ 'module': '',
            \ 'local class': 'local class',
            \ 'type': 'type',
            \ 'enum': '',
            \ 'enum member': '',
            \ 'alias': '',
            \ 'type parameter': 'type param',
            \ 'primitive type': 'primitive type',
            \ 'var': '',
            \ 'local var': '',
            \ 'property': '',
            \ 'let': '',
            \ 'const': '',
            \ 'label': 'label',
            \ 'parameter': 'param',
            \ 'index': 'index',
            \ 'function': '',
            \ 'local function': 'local function',
            \ 'method': '',
            \ 'getter': '',
            \ 'setter': '',
            \ 'call': 'call',
            \ 'constructor': '',
            \}
" }}}

" neovimhaskell/haskell-vim {{{
" =============================================================================

" Align 'then' two spaces after 'if'
let g:haskell_indent_if = 2
" Indent 'where' block two spaces under previous body
let g:haskell_indent_before_where = 2
" Allow a second case indent style (see haskell-vim README)
let g:haskell_indent_case_alternative = 1
" Only next under 'let' if there's an equals sign
let g:haskell_indent_let_no_in = 0
" }}}

" hindent & stylish-haskell {{{
" =============================================================================

" Indenting on save is too aggressive for me
let g:hindent_on_save = 0

" Helper function, called below with mappings
function! HaskellFormat(which) abort
  if a:which ==# 'hindent' || a:which ==# 'both'
    :Hindent
  endif
  if a:which ==# 'stylish' || a:which ==# 'both'
    silent! exe 'undojoin'
    silent! exe 'keepjumps %!stylish-haskell'
  endif
endfunction

" Key bindings
augroup haskellStylish
  au!
  " Just hindent
  au FileType haskell nnoremap <leader>hi :Hindent<CR>
  " Just stylish-haskell
  au FileType haskell nnoremap <leader>hs :call HaskellFormat('stylish')<CR>
  " First hindent, then stylish-haskell
  au FileType haskell nnoremap <leader>hf :call HaskellFormat('both')<CR>
augroup END
" }}}

" parsonsmatt/intero-neovim {{{
" =============================================================================

" Prefer starting Intero manually (faster startup times)
let g:intero_start_immediately = 0
" Use ALE (works even when not using Intero)
let g:intero_use_neomake = 0

augroup interoMaps
  au!

  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  au FileType haskell map <leader>t <Plug>InteroGenericType
  au FileType haskell map <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
  au FileType haskell nnoremap <silent> <leader>iu :InteroUses<CR>
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END
" }}}

" eagletmt/neco-ghc {{{
" =============================================================================
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" }}}

" elmcast/elm-vim {{{
" =============================================================================
let g:elm_format_autosave = 1

let g:elm_setup_keybindings = 0

augroup elmMaps
  au!

  au FileType elm nmap <leader>em <Plug>(elm-make)
  au FileType elm nmap <leader>eb <Plug>(elm-make-main)
  au FileType elm nmap <leader>et <Plug>(elm-test)
  au FileType elm nmap <leader>er <Plug>(elm-repl)
  au FileType elm nmap <leader>ee <Plug>(elm-error-detail)
  au FileType elm nmap <leader>ed <Plug>(elm-show-docs)
  au FileType elm nmap <leader>ew <Plug>(elm-browse-docs)
augroup END
" }}}

" SirVer/ultisnips {{{
" =============================================================================

" Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger="<tab>"

" }}}
