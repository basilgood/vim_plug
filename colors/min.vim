hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'min'

" base
hi Normal                ctermfg=249    ctermbg=NONE cterm=NONE
hi EndOfBuffer           ctermfg=8      ctermbg=NONE cterm=NONE

" programming literals
hi Comment               ctermfg=8      ctermbg=NONE cterm=italic
hi Constant              ctermfg=104    cterm=NONE
hi String                ctermfg=37
hi Character             ctermfg=166
hi Number                ctermfg=204
hi Boolean               ctermfg=204
hi Float                 ctermfg=204

" programming statements
hi Identifier            ctermfg=215    cterm=NONE
hi Function              ctermfg=103    ctermbg=NONE cterm=italic
hi Statement             ctermfg=219    cterm=NONE
hi Conditional           ctermfg=217    cterm=NONE
hi Repeat                ctermfg=217    cterm=NONE
hi Label                 ctermfg=158    cterm=NONE
hi Operator              ctermfg=229    cterm=NONE
hi Keyword               ctermfg=219    cterm=NONE
hi Exception             ctermfg=217    cterm=NONE

" programming pre-processes
hi PreProc               ctermfg=174    cterm=NONE
hi Include               ctermfg=174
hi Define                ctermfg=174
hi Macro                 ctermfg=174
hi PreCondit             ctermfg=174

" programming types
hi Type                  ctermfg=110    cterm=NONE
hi StorageClass          ctermfg=110
hi Structure             ctermfg=75
hi Typedef               ctermfg=110

" specials
hi Special               ctermfg=69
hi Delimiter             ctermfg=255
hi SpecialComment        ctermfg=245    cterm=NONE
hi Debug                 ctermfg=219    cterm=NONE
hi SpecialKey            ctermfg=61     cterm=NONE

" vim views
hi Cursor                ctermfg=16     ctermbg=253
hi CursorIM              ctermfg=16     ctermbg=124
hi CursorLine            ctermbg=235    cterm=NONE
hi CursorColumn          ctermbg=235    cterm=NONE
hi ColorColumn           ctermbg=23
hi Conceal               ctermfg=240
hi LineNr                ctermfg=8      ctermbg=NONE
hi CursorLineNr          ctermfg=7      ctermbg=235  cterm=NONE
hi FoldColumn            ctermfg=240    ctermbg=233
hi SignColumn            ctermfg=NONE   ctermbg=NONE
hi Folded                ctermfg=109    ctermbg=16
hi Search                ctermfg=7      ctermbg=59   cterm=NONE
hi IncSearch             ctermfg=16     ctermbg=202
hi QuickFixLine          ctermfg=202    ctermbg=NONE
hi NonText               ctermfg=8      ctermbg=NONE cterm=NONE
hi SpecialKey            ctermfg=8      ctermbg=NONE cterm=NONE
hi StatusLine            cterm=reverse  ctermbg=234  ctermfg=245
hi StatusLineNC          cterm=reverse  ctermbg=238  ctermfg=233
hi StatusLineTerm        cterm=reverse  ctermbg=234  ctermfg=245
hi StatusLineTermNC      cterm=reverse  ctermbg=238  ctermfg=233
hi Todo                  ctermfg=33     ctermbg=NONE cterm=NONE
hi TabLine               cterm=NONE     ctermbg=233  ctermfg=238
hi TabLineFill           cterm=reverse  ctermbg=238  ctermfg=233
hi TabLineSel            cterm=NONE     ctermbg=234  ctermfg=252
hi Title                 ctermfg=227    cterm=NONE

" diffs
hi DiffAdd               ctermbg=235    cterm=NONE
hi DiffChange            ctermbg=235    cterm=NONE
hi DiffDelete            ctermfg=238    ctermbg=244  cterm=NONE
hi DiffText              ctermfg=255    ctermbg=167  cterm=NONE
hi diffAdded             ctermfg=40     cterm=NONE
hi diffRemoved           ctermfg=204    cterm=NONE

" complete menus
hi Pmenu                 ctermfg=NONE   ctermbg=237  cterm=NONE
hi PmenuSel              ctermfg=NONE   ctermbg=19
hi PmenuSbar             ctermbg=239
hi PmenuThumb            ctermbg=244

" errors
hi Error                 ctermfg=219    ctermbg=88
hi ErrorMsg              ctermfg=199    ctermbg=16   cterm=NONE
hi SpellBad              ctermbg=52
hi SpellCap              ctermbg=53
hi SpellLocal            ctermbg=53
hi SpellRare             ctermbg=53

" others
hi Directory             ctermfg=114    cterm=NONE
hi Ignore                ctermfg=244    ctermbg=232
hi MatchParen            ctermfg=255    ctermbg=16   cterm=NONE
hi ModeMsg               ctermfg=229
hi MoreMsg               ctermfg=229    cterm=NONE
hi Question              ctermfg=110
hi Underlined            ctermfg=244    cterm=underline
hi VertSplit             ctermfg=232    ctermbg=232  cterm=NONE
hi Visual                ctermfg=110    ctermbg=235  cterm=reverse
hi VisualNOS             ctermfg=NONE   ctermbg=NONE cterm=underline
hi WarningMsg            ctermfg=231    ctermbg=238  cterm=NONE
hi WildMenu              ctermfg=110    ctermbg=16

" plugin settings
hi GitGutterAdd          ctermfg=22
hi GitGutterChange       ctermfg=142
hi GitGutterDelete       ctermfg=9
hi GitGutterChangeDelete ctermfg=9
hi ALEWarningSign        ctermfg=yellow ctermbg=NONE
hi ALEErrorSign          ctermfg=red    ctermbg=NONE
