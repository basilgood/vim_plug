scriptencoding utf-8

set number
set mouse=a
" set cursorline
set noswapfile
set shortmess+=I
set hidden
set nowrap
set nostartofline
set splitbelow
set splitright
set switchbuf=useopen,usetab
set shada='250,\"100,:100,n~/.config/nvim/shada
set wildignore+=*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.vagrant/*,*/bower_components/*
set complete=.,w,b,u,t,i,k
set completeopt=menuone
set omnifunc=syntaxcomplete#Complete
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif
set hlsearch|nohlsearch
set sidescrolloff=5
set sidescroll=1
set expandtab
set shiftwidth=2
set softtabstop=-1
set shiftround
set inccommand=nosplit
set updatetime=750
set clipboard^=unnamedplus,unnamed
set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:>,precedes:<,nbsp:•
set statusline=%f%m%r%h%w%=%{fugitive#head()}\ (%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
