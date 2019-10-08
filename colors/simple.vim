" Name:         simple.vim
" Description:  colors from gruvbox-material
set background=dark
highlight clear

let g:colors_name = 'simple'
if exists('syntax_on')
  syntax reset
endif

highlight Normal         guifg=#dfbf8e guibg=#1d2021 gui=NONE      cterm=NONE
highlight Comment        guifg=#928374 guibg=NONE    guisp=NONE    gui=italic      cterm=italic
highlight Constant       guifg=#d3869b guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight String         guifg=#a9b665 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Character      guifg=#d3869b guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Number         guifg=#d3869b guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Boolean        guifg=#d3869b guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Float          guifg=#d3869b guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE

highlight Identifier     guifg=#7daea3 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Function       guifg=#a9b665 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE

highlight Statement      guifg=#ea6962 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Conditional    guifg=#ea6962 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight default link Repeat Statement
highlight default link Label Statement
highlight default link Operator Statement
highlight default link Keyword Statement
highlight default link Exception Statement

highlight PreProc        guifg=#89b482 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Include        guifg=#89b482 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight default link Define PreProc
highlight default link Macro PreProc
highlight default link PreCondit Preproc

highlight Type           guifg=#e3a84e guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Typedef        guifg=#e3a84e guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight StorageClass   guifg=#e78a4e guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight Structure      guifg=#89b482 guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE

highlight Special        guifg=#e78a4e guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE
highlight default link SpecialChar Special
highlight default link Tag Special
highlight default link Delimiter Special
highlight default link SpecialComment Special
highlight default link Debug Special

highlight TabLine        guifg=#999999 guibg=#444444 gui=NONE      cterm=NONE
highlight TabLineFill    guifg=NONE    guibg=#444444 gui=NONE      cterm=NONE
highlight TabLineSel     guifg=#c9d05c guibg=NONE    gui=NONE      cterm=NONE

highlight Visual         guifg=NONE    guibg=#405260 gui=NONE      cterm=NONE
highlight VisualNOS      guifg=NONE    guibg=#4d6b67 gui=NONE      cterm=NONE
highlight Underlined     guifg=#7daea3 guibg=NONE    guisp=NONE    gui=underline   cterm=underline

highlight ErrorMsg       guifg=#ea6962 guibg=NONE    guisp=NONE    gui=bold        cterm=bold
highlight WarningMsg     guifg=#e3a84e guibg=NONE    guisp=NONE    gui=bold        cterm=bold
highlight ModeMsg        guifg=#1d2021 guibg=#a89984 guisp=NONE    gui=bold        cterm=bold
highlight MoreMsg        guifg=#e3a84e guibg=NONE    guisp=NONE    gui=bold        cterm=bold
highlight default link Error ErrorMsg
highlight default link FullSpace Error
highlight Question       guifg=#e78a4e guibg=NONE    guisp=NONE    gui=bold        cterm=bold
highlight Exception      guifg=#A6E22E gui=bold

highlight StatusLine     guifg=#1d1d1d guibg=#ad9b80 gui=bold      cterm=bold
highlight StatusLineNC   guifg=#999999 guibg=#444444 gui=NONE      cterm=NONE
highlight WildMenu       guifg=#282828 guibg=#c9d05c gui=NONE      cterm=NONE
highlight VertSplit      guifg=#333333 guibg=#333333 gui=NONE      cterm=NONE

highlight Todo           guifg=#928374 guibg=NONE    guisp=NONE    gui=bold,italic cterm=bold,italic
highlight DiffAdd        term=none cterm=none ctermfg=none ctermbg=22 guifg=fg guibg=#005f00
highlight DiffChange     term=none cterm=none ctermfg=none ctermbg=52 guifg=fg guibg=#5f0000
highlight DiffDelete     term=none cterm=none ctermfg=none ctermbg=88 guifg=fg guibg=#870000
highlight DiffText       term=none cterm=none ctermfg=none ctermbg=160 guifg=fg guibg=#df0000
highlight DiffFile       term=none cterm=none ctermfg=47 ctermbg=none guifg=#00ff5f guibg=bg
highlight DiffNewFile    term=none cterm=none ctermfg=199 ctermbg=none guifg=#ff00af guibg=bg
highlight default link DiffRemoved DiffDelete
highlight DiffLine       term=none cterm=none ctermfg=129 ctermbg=none guifg=#af00ff guibg=bg
highlight default link DiffAdded DiffAdd
highlight Ignore         guifg=#dfbf8e guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE

highlight Folded         guifg=NONE    guibg=#3c3836 guisp=NONE    gui=NONE        cterm=NONE
highlight FoldColumn     guifg=NONE    guibg=#3c3836 guisp=NONE    gui=NONE        cterm=NONE
highlight SignColumn     guifg=NONE    guibg=#1d2021 guisp=NONE    gui=NONE        cterm=NONE
highlight NonText        guifg=#5c6370 guibg=NONE    gui=NONE      cterm=NONE
highlight SpecialKey     guifg=#5c6370 guibg=NONE    gui=NONE      cterm=NONE
highlight Cursor         guifg=#000000 guibg=#99ff99 gui=NONE      cterm=NONE
highlight CursorLine     guifg=NONE    guibg=#2a303b gui=NONE      cterm=NONE
highlight CursorLineNr   guifg=#83a598 guibg=NONE    gui=NONE      cterm=NONE
highlight CursorColumn   guifg=NONE    guibg=#333333 gui=NONE      cterm=NONE
highlight ColorColumn    guifg=NONE    guibg=#333333 gui=NONE      cterm=NONE
highlight LineNr         guifg=#484848 guibg=#1d2021 guisp=NONE    gui=NONE        cterm=NONE
highlight CursorIM       guifg=#000000 guibg=#cc9999 gui=NONE      cterm=NONE
highlight MatchParen     guifg=#fade3e guibg=NONE    gui=underline cterm=underline
highlight Pmenu          guifg=#dfbf8e guibg=#504945 guisp=NONE    gui=NONE        cterm=NONE
highlight PmenuSbar      guifg=NONE    guibg=#504945 guisp=NONE    gui=NONE        cterm=NONE
highlight PmenuSel       guifg=#1d2021 guibg=#a89984 guisp=NONE    gui=NONE        cterm=NONE
highlight PmenuThumb     guifg=NONE    guibg=#7c6f64 guisp=NONE    gui=NONE        cterm=NONE
highlight Search         guifg=#ebdbb2 guibg=#574c74 gui=bold
highlight IncSearch      guifg=#d9d1af guibg=#b0507c gui=NONE      cterm=NONE
highlight QuickFixLine   guifg=#d9d1af guibg=NONE    guisp=NONE    gui=NONE        cterm=NONE

highlight SpellBad       ctermbg=95 ctermfg=252 gui=undercurl guisp=#e27878
highlight SpellCap       ctermbg=24 ctermfg=252 gui=undercurl guisp=#84a0c6
highlight SpellLocal     ctermbg=23 ctermfg=252 gui=undercurl guisp=#89b8c2
highlight SpellRare      ctermbg=97 ctermfg=252 gui=undercurl guisp=#a093c7

hi diffAdded             guifg=#a9b665 gui=NONE ctermfg=46  cterm=NONE
hi diffRemoved           guifg=#ea6962 gui=NONE ctermfg=203 cterm=NONE
hi link diffSubname Normal
hi DiffAdd               guifg=#8ec07c guibg=#1d2021 cterm=NONE
hi link DiffChange NONE
hi clear DiffChange
hi DiffDelete            guifg=#f93d3d guibg=#1d2021 cterm=NONE
hi DiffText              guifg=#FFB86C guibg=#14141a gui=NONE cterm=NONE

highlight default link vimCmplxRepeat Normal

highlight Terminal       guifg=#ebdbb2 guibg=#1d2021 gui=NONE      cterm=NONE
highlight Conceal        guifg=#ebdbb2 guibg=NONE    gui=NONE      cterm=NONE
highlight Title          guifg=#a9b665 guibg=NONE    guisp=NONE    gui=bold        cterm=bold
highlight Directory      guifg=#a9b665 guibg=NONE    gui=NONE      cterm=NONE

" ALE lint
highlight ALEWarningSign guifg=#fabd2f guibg=#1d2021 gui=NONE cterm=NONE
highlight ALEErrorSign   guifg=#f93d3d guibg=#1d2021 gui=NONE cterm=NONE

" ParenMatch
highlight ParenMatch     term=underline cterm=underline gui=underline
