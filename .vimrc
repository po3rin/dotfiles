"plugin ----------------------------------
call plug#begin()

" color
Plug 'cocopon/iceberg.vim'

" LSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

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

" tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" other
Plug 'easymotion/vim-easymotion'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'natebosch/vim-lsc'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-jp/vital.vim'
Plug 'cohama/lexima.vim'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'iamcco/markdown-preview.nvim', { 'for': ['markdown'], 'do': 'cd app & yarn install'  }

call plug#end()


" common ---------------------------------
set encoding=UTF-8
inoremap jj <esc>
set belloff=all

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
set number "行数表示"
set fenc=utf-8 "utf-8にする"
set nobackup "バックアップを作らない
set wildmode=list:longest "タブ補完モード
set relativenumber ""相対行数
set showmatch "括弧入力時の対応する括弧を表示
set hlsearch "検索語句のハイライト

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

" クリップボードを共有
if has("mac")
  set clipboard+=unnamed
else
  set clipboard^=unnamedplus
endif


" tree -------------------------------
nnoremap <silent> ;t :NERDTreeToggle<CR>


" color scheme ------------------------
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme iceberg


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


" replace ----------------------
" ref) https://liginc.co.jp/469142
" ref) http://engineerspirit.com/2017/06/24/post-1424/
map ;r <Plug>(operator-replace)


" easy motion ---------------- 
" ref) https://github.com/easymotion/vim-easymotion
map ;e <Plug>(easymotion-bd-f)


" lsp -----------------------
" ref) https://mattn.kaoriya.net/software/vim/20191231213507.html

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  set completeopt^=popup

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

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1

" gofmtmd -----------------------
let g:gofmtmd_auto_fmt = 1

