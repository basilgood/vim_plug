local cmd = vim.cmd
cmd 'autocmd TextYankPost * lua vim.highlight.on_yank {higroup = "IncSearch", timeout = 500}'
cmd [[autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
exe "normal! g`\"" | endif]]
cmd 'autocmd FileType qf wincmd J'
cmd 'autocmd BufWinEnter * if &ft == "help" | wincmd J | end'
cmd 'autocmd InsertLeave * if &l:diff | diffupdate | endif'
cmd 'autocmd BufWritePre * if !isdirectory(expand("%:h", v:true)) | call mkdir(expand("%:h", v:true), "p") | endif'
cmd 'autocmd! VimResume * checktime'
cmd 'autocmd! VimResume * if exists("g:loaded_gitgutter") | call gitgutter#all(1) | endif'
cmd 'autocmd InsertLeave * set nopaste'
cmd 'autocmd BufNewFile,BufRead config setlocal filetype=config'
cmd 'autocmd BufWinEnter *.json setlocal conceallevel=0 concealcursor='
cmd 'autocmd BufReadPre *.json setlocal conceallevel=0 concealcursor='
cmd 'autocmd BufReadPre *.json setlocal formatoptions='
cmd 'autocmd FileType git setlocal nofoldenable'
cmd [[autocmd FileType gitcommit setlocal spell | setlocal textwidth=72 | setlocal colorcolumn=+1 |
setlocal nofoldenable]]
cmd 'autocmd TermOpen * setlocal nonumber norelativenumber'
cmd 'autocmd TermOpen * if &buftype ==# "terminal" | startinsert | endif'
cmd 'autocmd BufLeave term://* stopinsert'
cmd [[autocmd TermClose term://* if (expand('<afile>') !~ "fzf") | call nvim_input('<CR>') | endif]]
cmd 'autocmd Filetype * if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif'
cmd 'autocmd QuickFixCmdPost [^l]* copen'
