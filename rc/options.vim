scriptencoding utf-8

" set termguicolors
set number
set mouse=a
set cursorline
set lazyredraw
set noswapfile
set shortmess+=Icm
" set noshowmode
set nowrap
set splitbelow
set splitright
set switchbuf=useopen,usetab
set signcolumn=auto
set tabline=%!functions#tabline()
set omnifunc=syntaxcomplete#Complete
set completefunc=syntaxcomplete#Complete
set completeopt+=menuone,noselect
set completeopt-=preview
set complete=.,w,b,u,U,t,i,d,k
set pumheight=12
set gdefault
set hlsearch|nohlsearch
set nostartofline
set sidescrolloff=5
set sidescroll=1
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set shiftround
set diffopt+=context:3,indent-heuristic,algorithm:patience
set inccommand=nosplit
set timeoutlen=3000
set updatetime=300
set wildmode=longest:full,full
set helplang=en
set nospell
set spelllang=en_us
set fileformats=unix,dos,mac
let s:mkdir = function('mkdir')
set undodir=~/.cache/nvim/undo
call s:mkdir(&undodir, 'p')
set undofile
set list
let &g:listchars = 'tab:▸ ,trail:•,extends:❯,precedes:❮,nbsp:⦸'
augroup list_trail
  autocmd InsertEnter * set listchars-=trail:•
  autocmd InsertLeave * set listchars+=trail:•
augroup END
