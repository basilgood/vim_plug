scriptencoding utf-8

set number
set mouse=a
set cursorline
set noswapfile
set shortmess+=I
set hidden
set nowrap
set splitbelow
set splitright
set switchbuf=useopen,usetab
set wildignore+=*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*,*/.vagrant/*,*/bower_components/*
set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=noselect
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set complete=.,w,b,u,U,t,i,d,k
set pumheight=10
set omnifunc=syntaxcomplete#Complete
set hlsearch|nohlsearch
set sidescrolloff=5
set sidescroll=1
set expandtab
set softtabstop=2
set shiftwidth=2
set shiftround
set inccommand=nosplit
set updatetime=750
set list listchars=tab:▸\ ,eol:¬,trail:~,space:·,extends:»,precedes:«,nbsp:⦸
set statusline=
set statusline+=%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)
set statusline+=%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}
set statusline+=\ %f
set statusline+=\ %{&modified?'\ \ +':''}
set statusline+=\ %{&readonly?'\ \ ':''}
set statusline+=%=
set statusline+=\ %{''!=#&filetype?&filetype:'none'}
set statusline+=\ %5v/%l
set statusline+=\ %4L
