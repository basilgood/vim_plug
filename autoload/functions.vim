scriptencoding utf-8

"""" get file size
function! functions#getfilesize() abort
  if &encoding ==# &fileencoding || &fileencoding ==# ''
    let size = line2byte(line('$') + 1) - 1
    if !&endofline
      let size -= 1
    endif
  else
    let size = getfsize(expand('%'))
  endif

  if size < 0
    let size = 0
  endif
  for unit in ['B', 'KB', 'MB']
    if size < 1024
      return size . unit
    endif
    let size = size / 1024
  endfor
  return size . 'GB'
endfunction

"""" large file (lifepillar)
function! functions#large_file(name) abort
  let b:large_file = 1
  syntax clear
  set eventignore+=FileType
  let &backupskip .= ',' . a:name
  setlocal foldmethod=manual nofoldenable noswapfile noundofile norelativenumber
  augroup large_buffer
    autocmd!
    autocmd BufWinEnter <buffer> call <sid>restore_eventignore()
  augroup END
endfunction

function! s:restore_eventignore() abort
  set eventignore-=FileType
  autocmd! large_buffer
  augroup! large_buffer
endfunction

"""" highlight
function! functions#hl() abort
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction

"""" mkdir if not exists
function! functions#mkdirifnotexist() abort
  let dir = expand('%:p:h')
  if dir =~# '://'
    return
  endif
  if !isdirectory(dir)
    call mkdir(dir, 'p')
    echo 'Created non-existing directory: '.dir
  endif
endfunction

function! functions#mkdir(dir) abort
  if !isdirectory(a:dir)
    call mkdir(a:dir, 'p')
  endif
endfunction

"""" tabline
function! functions#tabline() abort
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, '&mod')
    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#StatusLine#' : '%#StatusLineNC#')
    let s .= ' ' . tab .':'
    let s .= (bufname !=# '' ? fnamemodify(bufname, ':t') . ' ' : 'No Name ')
    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  if (exists('g:tablineclosebutton'))
    let s .= '%=%999XX'
  endif
  return s
endfunction

function! functions#changedfiles() abort
  only
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec 'edit ' . filenames[0]
  for filename in filenames[1:]
    exec 'e ' . filename
  endfor
endfunction

"""" runner
function! RedrawScreen(channel)
    redraw!
endfunction

function! functions#runner(cmd) abort
  let x_file = expand('%:p')
  let x_cmd = a:cmd . x_file
  let job = job_start(['/bin/sh', '-c', x_cmd],
        \ {'close_cb': 'RedrawScreen'})
endfunction

" netrw
function! functions#innetrw() abort
  nnoremap <buffer> D <Nop>
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> J j<cr>
  nmap <buffer> K k<cr>
  nmap <buffer> qq :bn<bar>bd#<cr>
  nmap <buffer> D .terminal ++close rm -rf
endfunction

" completion
function! functions#inserttabwrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~# '\k'
    return "\<tab>"
  else
    return "\<c-n>"
  endif
endfunction

"""" visual select
function! functions#get_selected_text() abort
  let tmp = @"
  normal! gvy
  normal! gv
  let [tmp, @"] = [@", tmp]
  return tmp
endfunction

function! functions#plain_text_pattern(s) abort
  return substitute(substitute('\V'.escape(a:s, '\'), '\n', '\\n', 'g'), '\t', '\\t', 'g')
endfunction

function! functions#get_search_pat() abort
  return functions#plain_text_pattern(functions#get_selected_text())
endfunction

" search highlight
function! functions#hlnext() abort
  let l:higroup = matchend(getline('.'), '\c'.@/, col('.')-1) == col('.')
        \ ? 'SpellRare' : 'IncSearch'
  let b:cur_match = matchadd(l:higroup, '\c\%#'.@/, 101)
  redraw
  augroup HLNext
    autocmd CursorMoved <buffer>
          \   execute 'silent! call matchdelete('.b:cur_match.')'
          \ | redraw
          \ | autocmd! HLNext
  augroup END
endfunction

" windows
function! functions#nextwindow() abort
  if winnr('$') == 1
    silent! normal! ``z.
  else
    wincmd w
  endif
endfunction

function! functions#previouswindowortab()
  if winnr() > 1
    wincmd W
  else
    tabprevious
    execute winnr("$") . "wincmd w"
  endif
endfunction

" tab completion
function! functions#check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
