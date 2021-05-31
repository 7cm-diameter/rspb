if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state("$HOME/.cache/dein")
  call dein#begin("$HOME/.cache/dein")

  call dein#add("$HOME/.cache/dein/repos/github.com/Shougo/dein.vim")
  call dein#load_toml("$HOME/.config/nvim/toml/dein.toml", {"lazy": 0})
  call dein#load_toml("$HOME/.config/nvim/toml/dein_lazy.toml", {"lazy": 1})
  call dein#load_toml("$HOME/.config/nvim/toml/lang.toml", {"lazy": 1})
  call dein#load_toml("$HOME/.config/nvim/toml/color.toml", {"lazy": 0})

  call dein#end()
  call dein#save_state()
endif


if (has("termguicolors"))
  set termguicolors
endif

filetype plugin indent on
syntax enable
set hidden
set clipboard+=unnamedplus
set noswapfile
set hls
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split
set cursorline
set cursorcolumn
set encoding=utf-8
scriptencoding=utf-8
set fileencoding=utf-8
set wildoptions+=pum
set relativenumber
set autoindent
set list
set expandtab
set splitright
set signcolumn=yes
set completeopt-=preview
set shiftwidth=2
set tabstop=2
set pumblend=20
set winblend=20

colorscheme iceberg

highlight Normal ctermbg=none guibg=none
highlight NonText ctermbg=none guibg=none
highlight Folded ctermbg=none guibg=none
highlight EndOfBuffer ctermbg=none guibg=none
highlight LineNr ctermbg=none guibg=none

let g:mapleader = "\<Space>"

" 表示行移動
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" インサートモードでのカーソル移動
inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <A-l> <S-Right>
inoremap <A-h> <S-Left>

" 行追加/削除
nnoremap <leader>al :<C-u>call append(expand('.'), '')<Cr>j
vnoremap <leader>al :s/$/\r/gc<CR>
vnoremap <leader>dl :s/^$\n//gc<CR>

" 画面分割 + |に行結合をリマップ
nnoremap <Bar> $:let pos = getpos(".")<CR>:join<CR>:call setpos('.', pos)<CR>

" ペイン入れ替え
nnoremap <leader>mh <C-w>H
nnoremap <leader>mj <C-w>J
nnoremap <leader>mk <C-w>K
nnoremap <leader>ml <C-w>L

" ペイン削除
nnoremap <leader>cwh <C-w>h<C-w>c
nnoremap <leader>cwj <C-w>j<C-w>c
nnoremap <leader>cwk <C-w>k<C-w>c
nnoremap <leader>cwl <C-w>l<C-w>c

" ペインリサイズ
nnoremap <S-Left> :vertical resize -3<cr>
nnoremap <S-Down> :resize +3<cr>
nnoremap <S-Up> :resize -3<cr>
nnoremap <S-Right> :vertical resize +3<cr>

" ペイン移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" jjでノーマルモード移行
inoremap <silent> jj <ESC>
tnoremap <silent> jj <C-\><C-n>

" indent
vnoremap > >gv
vnoremap < <gv
nnoremap > >>
nnoremap < <<

" python path
let g:python3_host_prog = "$HOME/.config/nvim/.venv/bin/python"

" paste from yanked buffer
nnoremap py "0p
nnoremap pd p

" set extension
" au BufRead,BufNewFile *.sbt set filetype=scala
au BufRead,BufNewFile *.toml set filetype=toml
au BufRead,BufNewFile *.jl set filetype=julia

" rust-gdb
" nnoremap <leader>rd :GdbStart rust-gdb -q target/debug

augroup FolowTerm
  au!
  au TermOpen * setlocal norelativenumber
augroup END
