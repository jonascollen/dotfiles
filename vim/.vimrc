:set commentstring=#%s
:set background=dark

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

let g:plug_url_format = 'git@github.com:%s.git'
Plug 'preservim/NERDTree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'dracula/vim', { 'as': 'dracula' }
" Initialize plugin system
call plug#end()

colorscheme dracula

