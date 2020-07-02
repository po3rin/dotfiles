"plugin ----------------------------------
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'cocopon/iceberg.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'po3rin/vim-gofmtmd'
Plug 'vim-jp/vital.vim'
Plug 'cohama/lexima.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'chengzeyi/fzf-preview.vim'
Plug 'iamcco/markdown-preview.nvim', { 'for': ['markdown'], 'do': 'cd app & yarn install'  }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
let g:lsp_async_completion = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
call plug#end()


" common ---------------------------------
set autowrite
set encoding=UTF-8
inoremap jj <esc>

" <Leader>というプレフィックスキーにスペースを使用する
let g:mapleader = "\<Space>"

" スペース + wでファイル保存
nnoremap ;w :w<CR>
nnoremap ;q :q<CR>
nnoremap ;wq :wq<CR>

" Escを2回押すとハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>

" スペース + . でvimrcを開く
nnoremap <Leader>. :new ~/.vimrc<CR>

" 0番レジスタを常にペースト
nnoremap p "0p
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme iceberg
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
set nocompatible
set wildmenu
set number
set fenc=utf-8
set nobackup
set clipboard=unnamed,autoselect
set wildmode=list:longest
set relativenumber
set smartindent
set hlsearch
" インデント"
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> ;t :NERDTreeToggle<CR>

" comment -------------------------------
" ref) https://github.com/tpope/vim-commentary


" fugitive -------------------------------
" ref) https://github.com/tpope/vim-fugitive
map <C-g> :Gdiff<CR>


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
nnoremap <silent> ;c :FZFGGrep<CR>
nnoremap <silent> ;b :Buffers<CR>
nnoremap <silent> ;l :BLines<CR>
nnoremap <silent> ;h :History<CR>
nnoremap <silent> ;m :Mark<CR>


" replace ----------------------
" ref) https://liginc.co.jp/469142
" ref) http://engineerspirit.com/2017/06/24/post-1424/
map ;r <Plug>(operator-replace)


" easy motion ---------------- 
" ref) https://github.com/easymotion/vim-easymotion
" map <Leader>e <Plug>(easymotion-prefix)
map ;e <Plug>(easymotion-bd-f)


" golang --------------------------
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <C-d> :GoDescribe<CR>
map <C-r> :GoReferrers<CR>
map <C-k> :GoKeyify<CR>
map <C-i> :GoImplements<CR>
map <C-f> :GoFillStruct<CR>
map <C-r> :GoRename<CR>
map <C-e> :GoIfErr<CR>
map <C-a> :GoAddTags<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <buffer> <silent> gd :LspDefinition<cr>
nnoremap <buffer> <silent> <C-]> :LspDefinition<cr>
nnoremap <buffer> <silent> <C-t> <C-O><cr>

let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'errcheck']
let g:go_metalinter_autosave = 0
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_def_mapping_enabled = 1
let g:go_gocode_propose_builtins = 0

autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <leader>s <Plug>(go-def-split)
autocmd FileType go nmap <leader>v <Plug>(go-def-vertical)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"golang color
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_calls = 1

"golsp
if executable('golsp')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'go-lang',
        \ 'cmd': {server_info->['golsp', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
  augroup END
endif

" gofmtmd
let g:gofmtmd_auto_fmt = 1
