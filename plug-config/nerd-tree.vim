let g:NERDTreeWinPos = "right"

augroup nerdtree_open
    autocmd!
    autocmd VimEnter * NERDTree | wincmd p
augroup END

