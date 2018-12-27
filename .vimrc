"plugin
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'cocopon/iceberg.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'natebosch/vim-lsc'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
let g:lsp_async_completion = 1
call plug#end()

"common
set autowrite
inoremap jj <esc>
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme iceberg
set number
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set clipboard=unnamed,autoselect
set wildmode=list:longest
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
map <C-g> :Gdiff<CR>

" golang
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <C-d> :GoDescribe<CR>
map <C-r> :GoReferrers<CR>
map <C-k> :GoKeyify<CR>
map <C-i> :GoImplements<CR>
map <C-f> :GoFillStruct<CR>
map <C-r> :GoRename<CR>
map <C-e> :GoIfErr<CR>
map <C-j> :NERDTreeToggle<CR>
map <C-a> :GoAddTags<CR>
nnoremap <leader>a :cclose<CR>
nnoremap <buffer> <silent> gd :LspDefinition<cr>
nnoremap <buffer> <silent> <C-]> :LspDefinition<cr>
nnoremap <buffer> <silent> <C-t> <C-O><cr>

let mapleader = "\<Space>"
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_def_mapping_enabled = 0
let g:go_gocode_propose_builtins = 0

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
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
