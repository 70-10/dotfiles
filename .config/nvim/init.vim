syntax on
set termguicolors
set number
set clipboard=unnamed
set backspace=indent,eol,start

colorscheme molokai
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai', {'do': 'cp colors/* ~/.config/nvim/colors/'}
call plug#end()
