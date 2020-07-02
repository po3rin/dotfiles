"plugin ----------------------------------
call plug#begin()
" color
Plug 'cocopon/iceberg.vim'

" LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Go
Plug 'mattn/vim-goimports'
Plug 'po3rin/vim-gofmtmd'

" vsnip
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" other
Plug 'easymotion/vim-easymotion'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'natebosch/vim-lsc'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-jp/vital.vim'
Plug 'cohama/lexima.vim'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'iamcco/markdown-preview.nvim', { 'for': ['markdown'], 'do': 'cd app & yarn install'  }
Plug 'ryanoasis/vim-devicons'

call plug#end()


" common ---------------------------------
set encoding=UTF-8
inoremap jj <esc>
set belloff=all

" <Leader>というプレフィックスキーにスペースを使用する
let g:mapleader = "\<Space>"

" スペース + wでファイル保存
nnoremap ;w :w<CR>
nnoremap ;q :q<CR>
nnoremap ;wq :wq<CR>

" Escを2回押すとハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR>

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
set wildmode=list:longest
set relativenumber
set showmatch "括弧入力時の対応する括弧を表示
set hlsearch

" インデント"
vnoremap < <gv
vnoremap > >gv

" 改行時自動インデント 
set smartindent
set autoindent

" undoできる最大数 
set undolevels=1000

" 他のバッファに移動する時に自動保存
set autowrite

" クリップボードを共有
if has("mac")
  set clipboard+=unnamed
else
  set clipboard^=unnamedplus
endif

nnoremap <silent> ;t :NERDTreeToggle<CR>

" airline ------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'


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
map ;e <Plug>(easymotion-bd-f)

" lsp -----------------------
" ref) https://mattn.kaoriya.net/software/vim/20191231213507.htm

" TODO: replace vim-lsp-settings
" if executable('gopls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'gopls',
"         \ 'cmd': {server_info->['gopls']},
"         \ 'whitelist': ['go'],
"         \ })
"     autocmd BufWritePre *.go LspDocumentFormatSync
" endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  set completeopt^=popup

  " enable signs
  let g:lsp_signs_error = {'text': 'ｳﾎ'}
  let g:lsp_signs_warning = {'text': '🍌'}
  let g:lsp_signs_enabled = 1

  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> rn <plug>(lsp-rename)
  nmap <buffer> rf <plug>(lsp-references)
  nmap <buffer> im <plug>(lsp-implimentation)
  nmap <buffer> ne <plug>(lsp-next-error)
  nmap <buffer> pe <plug>(lsp-previous-error)
  nmap <buffer> pd <plug>(lsp-peek-definition)
  nmap <buffer> ho <plug>(lsp-hover)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
let g:lsp_async_completion = 1

" gofmtmd
let g:gofmtmd_auto_fmt = 1

