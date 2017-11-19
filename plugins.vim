if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
endif

silent! if plug#begin('~/.vim/plugged')

" Files
Plug 'scrooloose/nerdtree'
Plug 'francoiscabrol/ranger.vim'

" Theme
Plug 'millermedeiros/vim-statline'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

" Syntax
Plug 'pearofducks/ansible-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'qbbr/vim-twig'
Plug 'gabrielelana/vim-markdown'
Plug 'chr4/nginx.vim'
Plug 'pangloss/vim-javascript'

" Enhancements
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'kana/vim-niceblock'
Plug 'thirtythreeforty/lessspace.vim'

" Async commands
Plug 'skywind3000/asyncrun.vim'

" Search
Plug 'skwp/greplace.vim'

" Autocompletion
Plug 'Shougo/neocomplete.vim'
" Plug 'maralla/completor.vim'

" Lint
Plug 'w0rp/ale'

call plug#end()
endif
