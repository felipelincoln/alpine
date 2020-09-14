syntax enable
filetype plugin indent on
packloadall

set path+=**
set wildmenu
set noswapfile
set autoindent
set number
set expandtab
set hlsearch
set shiftwidth=2
set tabstop=2
set colorcolumn=120

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'

function OpenTreeIfEmpty()
    if @% == ""
        :25vsplit
        :find .
    endif
endfunction

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction

set pastetoggle=<F2>
nnoremap <Tab> <C-W>w
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

nnoremap <space> :%s///g<left><left>
nnoremap <space><space> :.,$s///g<left><left>
nnoremap <space><space><space> :.,.s///g<left><left>
nnoremap gg ggzz
nnoremap G Gzz
nnoremap ç :vertical resize 25<cr>
nnoremap <backspace> :e#<cr>

imap jj <esc>bgUwea

au VimEnter * call OpenTreeIfEmpty()
hi StatusLine ctermbg=Black ctermfg=Cyan
