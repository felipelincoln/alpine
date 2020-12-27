set encoding=UTF-8

" plugins (requires elixir)
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} "only for :CocInstall coc-elixir
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons' "requires hack mono nerdfont
Plug 'rakr/vim-one'
call plug#end()

" theme
set termguicolors
set background=dark
colorscheme one
let g:airline_theme='one'
let g:airline_powerline_fonts = 1 "requires fonts-powerline
" call one#highlight('Normal', 'b7b7b7', '131926', 'none')

" settings
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=120
set number
set relativenumber
set hlsearch
set pastetoggle=<F2>
set noswapfile
autocmd vimenter * NERDTree

" editing
function! Autocomplete()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <expr> <tab> Autocomplete()
inoremap <s-tab> <c-p>
nnoremap <space> :%s///g<left><left>
nnoremap <space><space> :.,$s///g<left><left>
nnoremap <space><space><space> :.,.s///g<left><left>

" navigation
nnoremap <tab> <c-w>w
nnoremap <backspace> :e#<cr>
