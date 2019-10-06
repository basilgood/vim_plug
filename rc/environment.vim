scriptencoding utf-8

let $CACHE      = expand('$HOME/.cache/')
let $CACHE_HOME = expand('$CACHE/nvim')
let $NVIM_PATH  = expand('~/.config/nvim')


"""" path
set path=.,**

"""" backup, swap, undo
set undofile
set nobackup
set noswapfile
