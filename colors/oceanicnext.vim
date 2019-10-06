" OceanicNext
" Author: Mike Hartington

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='oceanicnext'

hi Bold                       guifg=NONE    guibg=NONE    cterm=bold      ctermfg=NONE ctermbg=NONE
hi Debug                      guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Directory                  guifg=#6699cc guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi ErrorMsg                   guifg=#ec5f67 guibg=#1b2b34 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Exception                  guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi FoldColumn                 guifg=#6699cc guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Folded                     guifg=#65737e guibg=#343d46 cterm=italic    ctermfg=NONE ctermbg=NONE
hi IncSearch                  guifg=#d9d1af guibg=#b0507c gui=NONE      cterm=NONE
hi Italic                     guifg=NONE    guibg=NONE    ctermfg=NONE    ctermbg=NONE cterm=italic

hi Macro                      guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi MatchParen                 guifg=#c0c5ce guibg=#65737e cterm=NONE      ctermfg=NONE ctermbg=NONE
hi ModeMsg                    guifg=#99c794 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi MoreMsg                    guifg=#99c794 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Question                   guifg=#6699cc guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Search                     guifg=#ebdbb2 guibg=#574c74 gui=bold
hi SpecialKey                 guifg=#65737e guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi TooLong                    guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Underlined                 guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Visual                     guibg=NONE    guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi VisualNOS                  guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi WarningMsg                 guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi WildMenu                   guifg=#ffffff guibg=#6699cc cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Title                      guifg=#6699cc guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Conceal                    guifg=#6699cc guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Cursor                     guifg=#1b2b34 guibg=#c0c5ce cterm=NONE      ctermfg=NONE ctermbg=NONE
hi NonText                    guifg=#65737e guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Normal                     guifg=#c0c5ce guibg=#1b2b34 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi EndOfBuffer                guifg=#c0c5ce guibg=#1b2b34 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi LineNr                     guifg=#65737e guibg=#1b2b34 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi SignColumn                 guifg=#1b2b34 guibg=#1b2b34 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi StatusLine                 guifg=#1d1d1d guibg=#ad9b80 gui=bold      cterm=bold
hi StatusLineNC               guifg=#999999 guibg=#444444 gui=NONE      cterm=NONE
hi VertSplit                  guifg=#1b2b34 guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi ColorColumn                guifg=NONE    guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi CursorColumn               guifg=NONE    guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi CursorLine                 guifg=NONE    guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi CursorLineNR               guifg=#1b2b34 guibg=#1b2b34 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi CursorLineNr               guifg=#65737e guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi PMenu                      guifg=#a7adba guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi PMenuSel                   guifg=#ffffff guibg=#6699cc cterm=NONE      ctermfg=NONE ctermbg=NONE
hi PmenuSbar                  guifg=NONE    guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi PmenuThumb                 guifg=NONE    guibg=#d8dee9 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi TabLine                    guifg=#65737e guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi TabLineFill                guifg=#65737e guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi TabLineSel                 guifg=#99c794 guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi helpExample                guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi helpCommand                guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE

hi Boolean                    guifg=#f99157 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Character                  guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Comment                    guifg=#65737e guibg=NONE    cterm=italic    ctermfg=NONE ctermbg=NONE
hi Conditional                guifg=#c594c5 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Constant                   guifg=#f99157 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Define                     guifg=#c594c5 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Delimiter                  guifg=#ab7967 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Float                      guifg=#f99157 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Function                   guifg=#6699cc guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Identifier                 guifg=#62b3b2 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Include                    guifg=#6699cc guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Keyword                    guifg=#c594c5 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Label                      guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Number                     guifg=#f99157 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Operator                   guifg=#c0c5ce guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi PreProc                    guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Repeat                     guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Special                    guifg=#62b3b2 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi SpecialChar                guifg=#ab7967 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Statement                  guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi StorageClass               guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi String                     guifg=#99c794 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Structure                  guifg=#c594c5 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Tag                        guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Todo                       guifg=#fac863 guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Type                       guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi Typedef                    guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE

hi SpellBad                   guifg=NONE    guibg=NONE    cterm=undercurl ctermfg=NONE ctermbg=NONE
hi SpellLocal                 guifg=NONE    guibg=NONE    cterm=undercurl ctermfg=NONE ctermbg=NONE
hi SpellCap                   guifg=NONE    guibg=NONE    cterm=undercurl ctermfg=NONE ctermbg=NONE
hi SpellRare                  guifg=NONE    guibg=NONE    cterm=undercurl ctermfg=NONE ctermbg=NONE

hi csClass                    guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi csAttribute                guifg=#fac863 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi csModifier                 guifg=#c594c5 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi csType                     guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi csUnspecifiedStatement     guifg=#6699cc guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi csContextualStatement      guifg=#c594c5 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi csNewDecleration           guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi cOperator                  guifg=#62b3b2 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi cPreCondit                 guifg=#c594c5 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE

hi cssColor                   guifg=#62b3b2 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi cssBraces                  guifg=#c0c5ce guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi cssClassName               guifg=#c594c5 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE


hi DiffAdd                    guifg=#99c794 guibg=#343d46 cterm=bold      ctermfg=NONE ctermbg=NONE
hi DiffChange                 guifg=#65737e guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi DiffDelete                 guifg=#ec5f67 guibg=#343d46 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi DiffText                   guifg=#6699cc guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi DiffAdded                  guifg=#ffffff guibg=#99c794 cterm=bold      ctermfg=NONE ctermbg=NONE
hi DiffFile                   guifg=#ec5f67 guibg=#1b2b34 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi DiffNewFile                guifg=#99c794 guibg=#1b2b34 cterm=NONE      ctermfg=NONE ctermbg=NONE
hi DiffLine                   guifg=#6699cc guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi DiffRemoved                guifg=#ffffff guibg=#ec5f67 cterm=bold      ctermfg=NONE ctermbg=NONE

hi gitCommitOverflow          guifg=#ec5f67 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
hi gitCommitSummary           guifg=#99c794 guibg=NONE    cterm=NONE      ctermfg=NONE ctermbg=NONE
