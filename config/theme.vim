set t_Co=256

if !has('vim')
  set term=xterm-256color

  " Change cursor shape.
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[0 q"
endif

" Enable true color
if exists('+termguicolors')
  set termguicolors
endif

colorscheme NeoSolarized
