execute pathogen#infect()                                                                                                                        
syntax on                                                                                                                                        
filetype plugin indent on
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
map <C-n> :NERDTreeToggle<CR>
colorscheme nord
