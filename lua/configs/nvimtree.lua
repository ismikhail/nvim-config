vim.cmd('nnoremap <space>e :NvimTreeToggle<CR>')

require'nvim-tree'.setup {
  auto_close = true,
  view = {
    allow_resize = true,
    side = 'right',
    width = 70
  }
}

