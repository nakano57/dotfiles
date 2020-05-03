" ### Plugins ### "
" dein.vim "
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " deoplete.nvim "
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1

	" TabNine "
  if has('win32') || has('win64')
    call dein#add('tbodt/deoplete-tabnine', { 'build': 'powershell.exe .\install.ps1' })
  else
    call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })
  endif

  " ale "
  call dein#add('w0rp/ale')
  "molokaiのカラーテーマ"
  call dein#add('tomasiser/vim-code-dark')
  "構文チェックを行う。
  call dein#add('scrooloose/syntastic')
  "()を補間する。
  call dein#add('Townk/vim-autoclose')
  "() 色付け:
  call dein#add('itchyny/lightline.vim')
  "インデントの色付け
  call dein#add('Yggdroot/indentLine')
  " 末尾の全角と半角の空白文字を赤くハイライト
  call dein#add('bronson/vim-trailing-whitespace')
  " Airline "
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  " 多言語パック  "
  call dein#add('sheerun/vim-polyglot')
  " Auto Save "
  call dein#add('vim-scripts/vim-auto-save')
  " Bracket Pair Colorizer "
	call dein#add('luochen1990/rainbow')
  " indent colorizer "
	call dein#add('nathanaelkane/vim-indent-guides')
	" 末尾の全角と半角の空白文字を赤くハイライト "
	call dein#add('bronson/vim-trailing-whitespace')
	" File manager "
	call dein#add('Shougo/vimfiler')
	" Unite "
	call dein#add('Shougo/unite.vim')
	" indent line "
	"call dein#add('Yggdroot/indentLine')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Key Settings "
set backspace=indent,eol,start "BackSpaceでどこまでも消せるようにする
set whichwrap=b,s,<,>,[,] "左右のカーソル移動で行間移動可能にする。
set clipboard+=unnamed
set mouse=a
set ttymouse=xterm2

" vimfiler settings "
noremap sf :VimFilerBufferDir -split -simple -winwidth=45 -toggle -no-quit<CR>
let g:vimfiler_as_default_explorer=1

" Auto Sabe Settings "
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

" Airline Settings "
let g:airline#extensions#tabline#enabled = 1
nnoremap <silent> <C-j> <Plug>AirlineSelectPrevTab
nnoremap <silent> <C-k> <Plug>AirlineSelectNextTab
for i in range(1, 9)
   execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
 endfor
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
 " t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tag]n :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tag]x :tabclose<CR>
 " tx タブを閉じる
map <silent> [Tag]<Left> :tabnext<CR>
 " tn 次のタブ
map <silent> [Tag]<Right> :tabprevious<CR>
" tp 前のタブ

" Display Settings"
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=2 "インデントをスペース4つ分に設定
set shiftwidth=2
set smartindent "オートインデント:
set virtualedit=block "文字のないところにカーソル移動できるようにする"
colorscheme codedark
let g:rainbow_active = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=yellow ctermbg=58
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=red ctermbg=52
let g:extra_whitespace_ignored_filetypes = [
      \   'markdown',
      \ ]
let g:extra_whitespace_ignored_filetypes = ['unite']

" ale Setting "
let g:ale_fix_on_save = 1
let b:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace','prettier'],
  \   'c': ['clang-format'],
  \   'cpp': ['clang-format'],
  \   'python': ['autopep8', 'isort'],
  \   'go': ['gofmt']
  \}
let g:ale_c_clangformat_options = '-style=LLVM'
let g:ale_linters_explicit = 1
" 表示に関する設定
"let g:ale_sign_error = ''
"let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
