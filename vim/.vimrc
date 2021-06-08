:set commentstring=#%s
:set background=dark

call plug#begin('~/.vim/plugged')

# Workaround as firewall not liking https on scriptserver

let g:plug_url_format = 'git@github.com:%s.git'
Plug 'preservim/NERDTree'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'

" Initialize plugin system
call plug#end()

colorscheme nord