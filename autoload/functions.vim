scriptencoding utf-8

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

function! functions#install_paq() abort
  exe '!git clone https://github.com/savq/paq-nvim.git ~/.local/share/nvim/site/pack/paqs/opt/paq-nvim'
endfunction

function! functions#makesession(overwrite) abort
  let b:sessiondir = $HOME . '/.local/share/nvim/sessions' . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  if a:overwrite == 0 && !empty(glob(b:filename))
    return
  endif
  exe 'mksession! ' . b:filename
endfunction

function! functions#loadsession() abort
  let b:sessiondir = $HOME . '/.cache/nvim/sessions' . getcwd()
  let b:sessionfile = b:sessiondir . '/session.vim'
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo 'No session loaded.'
  endif
endfunction

function! functions#listjump(list_type, direction, wrap) abort
  try
    exe a:list_type . a:direction
  catch /E553/ " wrap around last item
    exe a:list_type . a:wrap
  catch /E42/
    return
  catch /E163/
    return
  endtry
  normal! zz
endfunction

function! functions#innetrw() abort
  nmap <buffer><silent> <right> <cr>
  nmap <buffer><silent> <left> -
  nmap <buffer> <TAB> mf
  nmap <buffer> <S-TAB> mF
  nmap <buffer> <c-x> mfmx
  hi! link netrwSymLink Comment
  hi! link netrwPlain Comment
  hi netrwDir guifg=#8961b7
endfunction
