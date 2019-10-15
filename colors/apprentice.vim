" Apprentice.vim -- Vim color scheme.
" Author:      Romain Lafourcade (romainlafourcade@gmail.com)
" Webpage:     https://github.com/romainl/Apprentice
" Description: Essentially a streamlining and conversion to xterm colors of 'sorcerer' by Jeet Sukumaran (jeetsukumaran@gmailcom)
" Last Change: 2019-09-29

hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "apprentice"

hi Normal ctermbg=235 ctermfg=250 cterm=NONE guibg=#252525 guifg=#bcbcbc gui=NONE

set background=dark

hi NonText ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
hi EndOfBuffer ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
hi LineNr ctermbg=234 ctermfg=242 cterm=NONE guibg=#252525 guifg=#484848 gui=NONE
hi FoldColumn ctermbg=234 ctermfg=242 cterm=NONE guibg=#252525 guifg=#484848 gui=NONE
hi Folded ctermbg=234 ctermfg=242 cterm=NONE guibg=#252525 guifg=#484848 gui=NONE
hi MatchParen ctermbg=234 ctermfg=229 cterm=NONE guibg=#252525 guifg=#ffffaf gui=NONE
hi SignColumn ctermbg=234 ctermfg=242 cterm=NONE guibg=#252525 guifg=#484848 gui=NONE
hi Comment ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
hi Conceal ctermbg=NONE ctermfg=250 cterm=NONE guibg=NONE guifg=#bcbcbc gui=NONE
hi Constant ctermbg=NONE ctermfg=208 cterm=NONE guibg=NONE guifg=#ff8700 gui=NONE
hi Error ctermbg=NONE ctermfg=131 cterm=reverse guibg=NONE guifg=#af5f5f gui=reverse
hi Identifier ctermbg=NONE ctermfg=67 cterm=NONE guibg=NONE guifg=#5f87af gui=NONE
hi Ignore ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi PreProc ctermbg=NONE ctermfg=66 cterm=NONE guibg=NONE guifg=#5f8787 gui=NONE
hi Special ctermbg=NONE ctermfg=65 cterm=NONE guibg=NONE guifg=#5f875f gui=NONE
hi Statement ctermbg=NONE ctermfg=110 cterm=NONE guibg=NONE guifg=#8fafd7 gui=NONE
hi String ctermbg=NONE ctermfg=108 cterm=NONE guibg=NONE guifg=#87af87 gui=NONE
hi Todo ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
hi Type ctermbg=NONE ctermfg=103 cterm=NONE guibg=NONE guifg=#8787af gui=NONE
hi Underlined ctermbg=NONE ctermfg=66 cterm=underline guibg=NONE guifg=#5f8787 gui=underline
hi Pmenu ctermbg=238 ctermfg=250 cterm=NONE guibg=#444444 guifg=#bcbcbc gui=NONE
hi PmenuSbar ctermbg=240 ctermfg=NONE cterm=NONE guibg=#585858 guifg=NONE gui=NONE
hi PmenuSel ctermbg=66 ctermfg=235 cterm=NONE guibg=#5f8787 guifg=#252525 gui=NONE
hi PmenuThumb ctermbg=66 ctermfg=66 cterm=NONE guibg=#5f8787 guifg=#5f8787 gui=NONE
hi ErrorMsg ctermbg=131 ctermfg=235 cterm=NONE guibg=#af5f5f guifg=#252525 gui=NONE
hi ModeMsg ctermbg=108 ctermfg=235 cterm=NONE guibg=#87af87 guifg=#252525 gui=NONE
hi MoreMsg ctermbg=NONE ctermfg=66 cterm=NONE guibg=NONE guifg=#5f8787 gui=NONE
hi Question ctermbg=NONE ctermfg=108 cterm=NONE guibg=NONE guifg=#87af87 gui=NONE
hi WarningMsg ctermbg=NONE ctermfg=131 cterm=NONE guibg=NONE guifg=#af5f5f gui=NONE
hi TabLine ctermbg=238 ctermfg=101 cterm=NONE guibg=#444444 guifg=#87875f gui=NONE
hi TabLineFill ctermbg=238 ctermfg=238 cterm=NONE guibg=#444444 guifg=#444444 gui=NONE
hi TabLineSel ctermbg=101 ctermfg=235 cterm=NONE guibg=#87875f guifg=#252525 gui=NONE
hi ToolbarLine ctermbg=234 ctermfg=NONE cterm=NONE guibg=#252525 guifg=NONE gui=NONE
hi ToolbarButton ctermbg=240 ctermfg=250 cterm=NONE guibg=#585858 guifg=#bcbcbc gui=NONE
hi Cursor ctermbg=242 ctermfg=NONE cterm=NONE guibg=#484848 guifg=NONE gui=NONE
hi CursorColumn ctermbg=236 ctermfg=NONE cterm=NONE guibg=#303030 guifg=NONE gui=NONE
hi CursorLineNr ctermbg=236 ctermfg=73 cterm=NONE guibg=#303030 guifg=#5fafaf gui=NONE
hi CursorLine ctermbg=236 ctermfg=NONE cterm=NONE guibg=#303030 guifg=NONE gui=NONE
hi helpLeadBlank ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi helpNormal ctermbg=NONE ctermfg=NONE cterm=NONE guibg=NONE guifg=NONE gui=NONE
hi StatusLine ctermbg=101 ctermfg=235 cterm=NONE guibg=#5f7a87 guifg=#17171b gui=NONE
hi StatusLineNC ctermbg=238 ctermfg=101 cterm=NONE guibg=#444444 guifg=#5f7a87 gui=NONE
hi StatusLineTerm ctermbg=101 ctermfg=235 cterm=NONE guibg=#87875f guifg=#252525 gui=NONE
hi StatusLineTermNC ctermbg=238 ctermfg=101 cterm=NONE guibg=#444444 guifg=#87875f gui=NONE
hi Visual guifg=#8c98a7  guibg=NONE gui=reverse ctermfg=7 ctermbg=NONE cterm=reverse
hi VisualNOS ctermbg=NONE ctermfg=NONE cterm=underline guibg=NONE guifg=NONE gui=underline
hi VertSplit ctermbg=238 ctermfg=238 cterm=NONE guibg=#444444 guifg=#444444 gui=NONE
hi WildMenu ctermbg=110 ctermfg=235 cterm=NONE guibg=#8fafd7 guifg=#252525 gui=NONE
hi Function ctermbg=NONE ctermfg=229 cterm=NONE guibg=NONE guifg=#ffffaf gui=NONE
hi SpecialKey ctermbg=NONE ctermfg=240 cterm=NONE guibg=NONE guifg=#585858 gui=NONE
hi Title ctermbg=NONE ctermfg=231 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
hi diffAdded                      guifg=#a9b665  gui=NONE                      ctermfg=46    cterm=NONE
hi diffRemoved                    guifg=#ea6962  gui=NONE                      ctermfg=203   cterm=NONE
hi link diffSubname Normal
hi DiffAdd     ctermbg=234                   guifg=#8ec07c  guibg=#252525                    cterm=NONE
hi link DiffChange NONE
hi clear DiffChange
hi DiffDelete       ctermbg=234              guifg=#f93d3d  guibg=#252525                    cterm=NONE
hi DiffText     ctermbg=234                  guifg=#FFB86C  guibg=#252525     gui=NONE       cterm=NONE
hi IncSearch ctermbg=131 ctermfg=235 cterm=NONE guibg=#af5f5f guifg=#252525 gui=NONE
hi Search guifg=#8c98a7 guibg=NONE gui=reverse ctermfg=7 ctermbg=NONE cterm=reverse
hi QuickFixLine guifg=#d9d1af guibg=NONE guisp=NONE gui=NONE cterm=NONE
hi Directory ctermbg=NONE ctermfg=73 cterm=NONE guibg=NONE guifg=#5fafaf gui=NONE
hi debugPC ctermbg=67 ctermfg=NONE cterm=NONE guibg=#5f87af guifg=NONE gui=NONE
hi debugBreakpoint ctermbg=131 ctermfg=NONE cterm=NONE guibg=#af5f5f guifg=NONE gui=NONE
hi SpellBad ctermbg=NONE ctermfg=131 cterm=undercurl guibg=NONE guifg=#af5f5f gui=undercurl guisp=#af5f5f
hi SpellCap ctermbg=NONE ctermfg=73 cterm=undercurl guibg=NONE guifg=#5fafaf gui=undercurl guisp=#5fafaf
hi SpellLocal ctermbg=NONE ctermfg=65 cterm=undercurl guibg=NONE guifg=#5f875f gui=undercurl guisp=#5f875f
hi SpellRare ctermbg=NONE ctermfg=208 cterm=undercurl guibg=NONE guifg=#ff8700 gui=undercurl guisp=#ff8700
hi ColorColumn ctermbg=234 ctermfg=NONE cterm=NONE guibg=#252525 guifg=NONE gui=NONE


hi link Terminal Normal
hi link Number Constant
hi link CursorIM Cursor
hi link Boolean Constant
hi link Character Constant
hi link Conditional Statement
hi link Debug Special
hi link Define PreProc
hi link Delimiter Special
hi link Exception Statement
hi link Float Number
hi link HelpCommand Statement
hi link HelpExample Statement
hi link Include PreProc
hi link Keyword Statement
hi link Label Statement
hi link Macro PreProc
hi link Number Constant
hi link Operator Statement
hi link PreCondit PreProc
hi link Repeat Statement
hi link SpecialChar Special
hi link SpecialComment Special
hi link StorageClass Type
hi link Structure Type
hi link Tag Special
hi link Terminal Normal
hi link Typedef Type
hi link htmlEndTag htmlTagName
hi link htmlLink Function
hi link htmlSpecialTagName htmlTagName
hi link htmlTag htmlTagName
hi link htmlBold Normal
hi link htmlItalic Normal
hi link xmlTag Statement
hi link xmlTagName Statement
hi link xmlEndTag Statement
hi link markdownItalic Preproc
hi link asciidocQuotedEmphasized Preproc
hi link diffBDiffer WarningMsg
hi link diffCommon WarningMsg
hi link diffDiffer WarningMsg
hi link diffIdentical WarningMsg
hi link diffIsA WarningMsg
hi link diffNoEOL WarningMsg
hi link diffOnly WarningMsg
hi link diffRemoved WarningMsg
hi link diffAdded String

let g:terminal_ansi_colors = [
        \ '#252525',
        \ '#af5f5f',
        \ '#5f875f',
        \ '#87875f',
        \ '#5f87af',
        \ '#5f5f87',
        \ '#5f8787',
        \ '#484848',
        \ '#444444',
        \ '#ff8700',
        \ '#87af87',
        \ '#ffffaf',
        \ '#8fafd7',
        \ '#8787af',
        \ '#5fafaf',
        \ '#ffffff',
        \ ]

" Generated with RNB (https://github.com/romainl/vim-rnb)
