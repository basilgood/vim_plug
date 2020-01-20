scriptencoding utf-8

" netrw
function! functions#innetrw() abort
  nmap <buffer> <right> <cr>
  nmap <buffer> <left> -
  nmap <buffer> gq :bn<bar>bd#<cr>
  nmap <buffer> D .!rm -rf
endfunction

" highlight
function! functions#hl() abort
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction

" tabline
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

" fix insert leave
function! functions#insertleave() abort
  let cursorPos = col('.')
  let maxColumn = col('$')
  if cursorPos < maxColumn && cursorPos != 1
    return "\<Esc>l"
  else
    return "\<Esc>"
  endif
endfunction

" toggle
function! functions#toggle_option(option_name) abort
  execute 'setlocal' a:option_name.'!'
  execute 'setlocal' a:option_name.'?'
endfunction

" highlighting group
function! functions#hl() abort
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction

" search
highlight default link CurrentSearch IncSearch
command! -bar Nohlsearch ClearCurrentSearch | nohlsearch
command! -bar ClearCurrentSearch silent! call matchdelete(get(s:, 'current_search_id', -1))
function! functions#highlight_current() abort
  ClearCurrentSearch
  if get(v:, 'hlsearch', 0) == 1
    let pat = (&ignorecase && (!&smartcase || @/ !~# '\u')  ? '\c' : '\C') . '\m\%#' . (&magic ? '' : '\M') . @/
    let s:current_search_id = matchadd('CurrentSearch', pat, 10, get(s:, 'current_search_id', -1))
  endif
endfunction

" diff mappings
function! functions#diff_maps()
  nnoremap <buffer> zp :diffput<CR>
  nnoremap <buffer> zg :diffget<CR>
  vnoremap <buffer> zg :diffget<CR>
  vnoremap <buffer> zp :diffput<CR>
endfunction

" ale fixers
function! functions#togglefixonsave() abort
    let g:ale_fix_on_save = !g:ale_fix_on_save
    echo g:ale_fix_on_save == 1 ? 'ale_fix_on_save enabled' : 'ale_fix_on_save disabled'
endfunction

" lsp
function! functions#lspconfig() abort
  setlocal omnifunc=v:lua.vim.lsp.omnifunc
  nnoremap <silent> <c-]>      <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> <c-k>      <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> K          <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gd         <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> g0         <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <silent> gD         <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> 1gD        <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent><Leader>rf  <cmd>lua vim.lsp.buf.references({ includeDeclaration = true })<CR>
  nnoremap <silent><Leader>fmt <cmd>lua vim.lsp.buf.formatting()<CR>
endfunction
