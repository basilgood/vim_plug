if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

silent! if plug#begin('~/.vim/plugged')

" Files
Plug 'scrooloose/nerdtree'
Plug 'francoiscabrol/ranger.vim'

" Theme
Plug 'icymind/NeoSolarized'
Plug 'millermedeiros/vim-statline'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tpope/vim-fugitive'

" Syntax
Plug 'pearofducks/ansible-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'othree/csscomplete.vim'
Plug 'qbbr/vim-twig'
Plug 'chr4/nginx.vim'
Plug 'pangloss/vim-javascript'

" Enhancements
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'kana/vim-niceblock'
Plug 'thirtythreeforty/lessspace.vim'

" Autocomple
Plug 'Shougo/neocomplete.vim'

" Lint
Plug 'w0rp/ale'

call plug#end()
endif