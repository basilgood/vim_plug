scriptencoding utf-8

" visibility
set listchars=tab:▸\ ,trail:.
set list
set showbreak=\\

" conceal
set conceallevel=2
set concealcursor=nv

" completion
set completeopt&
set completeopt=preview
" set completeopt+=longest
set completeopt=menuone
set completeopt=noinsert
set completeopt=noselect
set omnifunc=csscomplete#CompleteCSS

set infercase "Ignore case on insert completion
set showfulltag "Show rich info for ins-completion

set wildmenu " Command line autocompletion
set wildmode=full

set nofoldenable "Disable fold
set splitbelow " sohw preview window at bottom
set splitright
set equalalways
" indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround

" lang
set spelllang=en "Spell checking language

" search
set incsearch "Incremental searching
set ignorecase "Ignore case in search patterns
set smartcase "Override the ignorecase option if the pattern contains upper case
set hlsearch | nohlsearch "Highlight search patterns, support reloading

" swap file
set noswapfile
set nobackup

"" misc
set number
set autoread "Automatically read file again which has been changed outside of Vim
set backspace=indent,eol,start "Working of <BS>,<Del>,CTRL-W,CTRL-U
set display=lastline "Display as much as possible of the last line
set grepformat=%f:%l:%c:%m,%f:%l:%m
set hidden "Display another buffer when current buffer isn't saved.
set history=1024 "Amount of Command history
set keywordprg=:help "Open Vim internal help by K command
set laststatus=2 "Always display statusline
set matchtime=1 "Tenths of a second to show the matching paren
set modeline "Set Vim local buffer option to specific file
set noerrorbells "Don't ring the bell for error messages
set novisualbell "Don't use visual bell instead of beeping
set shortmess+=I "Don't give the message when starting Vim :intro
set virtualedit=block "Cursor can be positioned virtually when Visual-block mode
set whichwrap=b,s,h,l,[,],<,> "Allow specified keys to move to the previous/next line
set wrap "Lines longer than the width of the window will wrap
set wrapscan "Searches wrap around the end of the file
set timeoutlen=1000
set ttimeoutlen=50

set clipboard=unnamedplus

set wildcharm=<C-z>
