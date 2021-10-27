"plugin ----------------------------------
call plug#begin()

" beta ----------
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'

" color
Plug 'cocopon/iceberg.vim'
Plug 'markvincze/panda-vim'
Plug 'arzg/vim-colors-xcode'

" test
Plug 'vim-test/vim-test'

" LSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hashivim/vim-terraform'
Plug 'prabirshrestha/async.vim'
Plug 'mattn/vim-gomod'

" Plug 'Shougo/deoplete.nvim'
" Plug 'lighttiger2505/deoplete-vim-lsp'

" fmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Go
Plug 'mattn/vim-goimports'
Plug 'po3rin/vim-gofmtmd'

" Python

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'
Plug 'ctrlpvim/ctrlp.vim'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'

" tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" other
Plug 'easymotion/vim-easymotion'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'natebosch/vim-lsc'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-jp/vital.vim'
Plug 'cohama/lexima.vim'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'thinca/vim-quickrun'
Plug 'osyo-manga/vim-over'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'mattn/vim-sonictemplate'

" window size
" Ctrl + e
Plug 'simeji/winresizer'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()

" common ---------------------------------
" https://www.soum.co.jp/misc/vim-no-susume/9/
" set mouse=a
" set ttymouse=xterm2

set encoding=UTF-8
inoremap jj <esc>
set belloff=all "vimで発生するbellをmute

" buffer
nnoremap ;m :bn<CR>

" ファイル保存
nnoremap ;w :w<CR>
nnoremap ;q :q<CR>

" Escを2回押すとハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>

" 0番レジスタを常にペースト
nnoremap p "0p

set nobackup " バックアップファイルを作らない
set noswapfile " スワップファイルを作らない

set autoread " 編集中のファイルが変更されたら自動で読み直す
set hidden " バッファが編集中でもその他のファイルを開けるように
set showcmd " 入力中のコマンドをステータスに表示する
set nocompatible "vi 互換モードで動作させない
set wildmode=list:longest "タブ補完モード
set showmatch "括弧入力時の対応する括弧を表示
set hlsearch "検索語句のハイライト
set number "行数セット

"未修正ファイルでもvim-gitgutter列を表示
set signcolumn=yes

" インデント"
vnoremap < <gv
vnoremap > >gv

" 改行時自動インデント 
set smartindent

" undoできる最大数 
set undolevels=1000

" 他のバッファに移動する時に自動保存
set autowrite

set splitbelow "新しいウィンドウを下に開く

" " クリップボードを共有
if has("mac")
  set clipboard+=unnamed
else
  set clipboard^=unnamedplus
endif

" https://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>       
nnoremap [Q :<C-u>cfirst<CR>
nnoremap ]Q :<C-u>clast<CR>
autocmd QuickFixCmdPost *grep* cwindow

" コメントアウト
" gcc

" 改行削除
" gJ

" tmux pain
" Ctrl-b + %
" Ctrl-b + "
" Ctrl-b + カーソル
" Ctrl-b + x

" tmux scroll
" Ctrl-b + [

au FileType qf nnoremap <silent><buffer>q :quit<CR>

" surround -------------------------
" https://github.com/tpope/vim-surround
" cs"''
" ds"
" S"

" vim-test ------------------------
" https://github.com/vim-test/vim-test 
" https://budougumi0617.github.io/2020/07/24/make_vimrc_with_lsp/

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

let test#strategy = "dispatch"
let test#go#runner = 'gotest'

" popup -----------------------------
command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })

" 補完 -------------------------------

" 補完表示時のEnterで改行をしない (TODO: fix)
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"
set completeopt=menuone,noinsert
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"


" replace ---------------------------
map <C-r> :OverCommandLine<CR>

" tree -------------------------------
" make file : m
nnoremap <silent> tt :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight

let g:NERDTreeLimitedSyntax = 1

let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['go'] = s:blue
let g:NERDTreeExtensionHighlightColor['py'] = s:green
let g:NERDTreeExtensionHighlightColor['env'] = s:white

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['LICENSE'] = s:yellow " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

" ale --------------------------------
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" " Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" color scheme ------------------------
syntax on
set termguicolors
let g:solarized_termcolors=256

autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" colorscheme iceberg
color panda
" colorscheme xcodedark

" airline ------------------------------
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1



" fugitive -------------------------------
" ref) https://github.com/tpope/vim-fugitive
map <C-g> :Gdiff<CR>
map <C-s> :Gstatus<CR>

" gitgutter ----------------------------
" nmap <Leader>hs <Plug>GitGutterStageHunk
" nmap <Leader>hu <Plug>GitGutterUndoHunk
" nmap <Leader>hp <Plug>GitGutterPreviewHunk
nmap ]c         <Plug>(GitGutterNextHunk)
nmap [c         <Plug>(GitGutterPrevHunk)
" omap ic         <Plug>GitGutterTextObjectInnerPending
" omap ac         <Plug>GitGutterTextObjectOuterPending
" xmap ic         <Plug>GitGutterTextObjectInnerVisual
" xmap ac         <Plug>GitGutterTextObjectOuterVisual
"

" in status page
" s	ステージ(add)する
" u	ステージしたものを取り除く(undo)
" =	diffをその場に開く・閉じる
" dv	変化の見やすい、いい感じのdiffを出す（すごく見やすいのでお試しあれ）
" <Enter>	編集する
" X	変更を取り消す

" vim-devicons ----------------------------
" ref) https://qiita.com/park-jh/items/4358d2d33a78ec0a2b5c

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf-8

" フォルダアイコンを表示
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif


" fzf -----------------------------
" ref) https://qiita.com/Sa2Knight/items/6635af9fc648a5431685
" ref) https://github.com/chengzeyi/fzf-preview.vim

nnoremap <silent> ;f :GFiles<CR>
nnoremap <silent> ;F :GFiles?<CR>
nnoremap <silent> ;g :FZFGGrep<CR>
nnoremap <silent> ;b :Buffers<CR>
nnoremap <silent> ;l :BLines<CR>
nnoremap <silent> ;h :History<CR>


" replace ----------------------
" ref) http://engineerspirit.com/2017/06/24/post-1424/
map ;r <Plug>(operator-replace)


" easy motion ---------------- 
" ref) https://github.com/easymotion/vim-easymotion
map ;e <Plug>(easymotion-bd-f)

" quickrun ------------------
" map ;qr <Plug>(quickrun)
" let g:quickrun_config = {}
" let g:quickrun_config = {
" \'*': {'split': ''},
" \'python': {'command': 'python3'},
" \}

" lsp -----------------------
" ref) https://mattn.kaoriya.net/software/vim/20191231213507.html

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  " set completeopt^=popup
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> rn <plug>(lsp-rename)
  nmap <buffer> rf <plug>(lsp-references)
  nmap <buffer> ;i <plug>(lsp-implimentation)
  nmap <buffer> ;n <plug>(lsp-next-error)
  nmap <buffer> ;p <plug>(lsp-previous-error)
  nmap <buffer> dp <plug>(lsp-peek-definition)
  nmap <buffer> ;h <plug>(lsp-hover)
  nmap <buffer> ;ca <plug>(lsp-code-action)
  nmap <buffer> ;pd <plug>(lsp-peek-definition)
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1

" fmt -------------------------
" https://github.com/google/vim-codefmt
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
"  autocmd FileType python AutoFormatBuffer yapf
"  autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

call glaive#Install()
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /Users/hiromu.nakamura/any/jar/google-java-format-1.9-all-deps.jar"

" python -----------------------
" augroup LspAutoFormatting
"   autocmd!
"   autocmd BufWritePre *.py LspDocumentFormatSync
" augroup END

" https://scrapbox.io/vimemo/Vim_%E3%81%A7_python_%E3%81%AE%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83%E3%82%92%E6%95%B4%E3%81%88%E3%82%8B_vim-lsp_%E4%BD%BF%E7%94%A8
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
 
augroup MyLsp
     autocmd!
     if executable('pyls')
         autocmd User lsp_setup call lsp#register_server({
             \ 'name': 'pyls',
             \ 'cmd': { servier_info -> ['pyls'] },
             \ 'whitelist': ['python'],
             \ 'workspace_config': {
             \   'pyls': {
             \       'plugins': {
             \           'jedi_definition': {
             \               'follow_imports': v:true, 
             \               'follow_builtin_imports': v:true
             \           },
             \ }}}
             \})
         autocmd FileType python call s:configure_lsp()
     endif
augroup END
 
function! s:configure_lsp() abort
     " omnifunc を設定
     setlocal omnifunc=lsp#complete
 
     nnoremap <buffer> gd :<C-u>LspDefinition<CR>
     nnoremap <buffer> gD :<C-u>LspReferences<CR>
endfunction

 " sign の表示を無効化 ( ALE で行うため )
let g:lsp_diagnostics_enabled = 0

if isdirectory(".venv")
	let $VIRTUAL_ENV = '.venv'
endif

" go -----------------------
let g:gofmtmd_auto_fmt = 1
let g:goimports = 1

" ddc ---------------------
