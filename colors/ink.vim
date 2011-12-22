" Vim color file
"
" Maintainer:  Sylvester Ink <sylvesterink at gmail.com>
" Last Change: 31 Mar 2011

set background=dark
hi clear
if exists("syntax on")
  syntax reset
endif

if has('eval')
  let g:colors_name="ink"
endif
" General colors {{{1
hi Normal 		guifg=#f6f3e8 guibg=#202020 gui=none
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi LineNr 		guifg=#857b6f guibg=#000000 gui=none
hi NonText 		guifg=#808080 guibg=#303030 gui=none
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none
hi MatchParen   guifg=#dddddd guibg=#32298f gui=bold
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Pmenu 		guifg=#f6f3e8 guibg=#444444 gui=none
hi PmenuSel 	guifg=#000000 guibg=#cae682 gui=none
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
hi VertSplit 	guifg=#444444 guibg=#444444 gui=none
hi StatusLine 	guifg=#f6f3e8 guibg=#444444 gui=none ctermfg=Black ctermBG=Grey
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=none ctermfg=Black ctermBG=Grey
hi CursorColumn guifg=fg      guibg=#2d2d2d gui=none
hi CursorLine   guifg=fg      guibg=#2d2d2d gui=none
"hi Ignore       guifg=#888888 guibg=bg      gui=bold
"hi Directory    guifg=#ffff60 guibg=bg      gui=bold
"hi MoreMsg      guifg=#80ff80 guibg=bg      gui=bold
"hi Conditional  guifg=#dddddd guibg=bg      gui=bold
"hi Repeat       guifg=#dddddd guibg=bg      gui=bold
"hi Label        guifg=#dddddd guibg=bg      gui=bold
"hi Operator     guifg=#dddddd guibg=bg      gui=bold
"hi ErrorMsg     guifg=#ffff60 guibg=#aa0000 gui=bold
"hi WildMenu     guifg=#ffff00 guibg=#00aa00 gui=bold
"hi FoldColumn   guifg=#00aaaa guibg=#444444 gui=bold
"hi SignColumn   guifg=#8888ff guibg=bg      gui=none
"hi Search       guifg=#dddddd guibg=#0000ff gui=none
"hi IncSearch    guifg=#dddddd guibg=#008080 gui=none
"hi WarningMsg   guifg=#ffff60 guibg=#008800 gui=bold
"hi Question     guifg=#80ff80 guibg=#008800 gui=bold
"hi TabLineFill  guifg=#80ff80 guibg=#008800 gui=bold
"hi TabLine      guifg=#80ff80 guibg=#008800 gui=bold
"hi TabLineSel   guifg=#ffff60 guibg=#008800 gui=bold
"hi TabLine      guifg=#66ff66 guibg=#008800 gui=bold
" Syntax Highlighting {{{1
hi Comment 		guifg=#99968b guibg=bg      gui=italic
hi Todo 		guifg=#333333 guibg=#ff9900 gui=italic
hi Constant 	guifg=#e5786d guibg=bg      gui=none
hi String 		guifg=#95e454 guibg=bg      gui=italic
hi Identifier 	guifg=#cae682 guibg=bg      gui=none
hi Function 	guifg=#afc770 guibg=bg      gui=none
hi Type 		guifg=#bbe682 guibg=bg      gui=none
hi Statement 	guifg=#8ac6f2 guibg=bg      gui=none
hi Keyword		guifg=#8ac6f2 guibg=bg      gui=none
hi PreProc 		guifg=#e5786d guibg=bg      gui=none
hi Number		guifg=#e5786d guibg=bg      gui=none
"hi Special		guifg=#e7f6da guibg=bg      gui=none
hi Special      guifg=#ff8800 guibg=bg      gui=none
"hi Include      guifg=#666666 guibg=bg      gui=bold
"hi Define       guifg=#666666 guibg=bg      gui=bold
"hi Macro        guifg=#666666 guibg=bg      gui=bold
"hi PreCondit    guifg=#666666 guibg=bg      gui=bold

" Specific for c {{{1
hi cOctalZero    guifg=#ff8800 guibg=bg      gui=none
hi cFormat       guifg=#ff8800 guibg=bg      gui=none
" Specific for diff {{{1
"hi DiffAdd      guifg=#ffff33 guibg=#404010 gui=bold term=none cterm=none ctermfg=green
"hi DiffChange                 guibg=#202020 gui=bold term=none            ctermfg=darkgrey
"hi DiffText     guifg=#3333ff guibg=#100040 gui=bold term=none cterm=none ctermfg=blue
"hi DiffDelete   guifg=#ff0000 guibg=#401010 gui=bold term=none cterm=none ctermfg=red
"hi diffLine     guifg=#444444 guibg=bg gui=bold term=none cterm=bold ctermfg=darkgrey
"hi diffOldLine  guifg=#444444 guibg=bg gui=none term=none cterm=none ctermfg=darkgrey
"hi diffOldFile  guifg=#444444 guibg=bg gui=none term=none cterm=none ctermfg=darkgrey
"hi diffNewFile  guifg=#444444 guibg=bg gui=none term=none cterm=none ctermfg=darkgrey
"hi diffAdded    guifg=#80ff80 guibg=bg gui=none term=none cterm=none ctermfg=green
"hi diffRemoved  guifg=#ff0000 guibg=bg gui=none term=none cterm=none ctermfg=red
"hi diffChanged  guifg=#0000ff guibg=bg gui=none term=none cterm=none ctermfg=blue
" Specific for doxygen {{{1
"hi Comment 		                guifg=#99968b guibg=bg      gui=italic
hi doxygenStart                guifg=#adada3 guibg=bg gui=italic
hi doxygenStartL               guifg=#adada3 guibg=bg gui=italic
hi doxygenBriefLine            guifg=#9996aa guibg=bg gui=italic
hi doxygenBrief                guifg=#9996aa guibg=bg gui=italic
hi doxygenBriefL               guifg=#9996aa guibg=bg gui=italic
hi doxygenPrevL                guifg=#adada3 guibg=bg gui=italic
hi doxygenComment              guifg=#adada3 guibg=bg gui=italic
hi doxygenCommentL             guifg=#9996aa guibg=bg gui=italic
hi doxygenSpecialMultiLineDesc guifg=#9996aa guibg=bg gui=italic
hi doxygenSpecial              guifg=#adada3 guibg=bg gui=italic
hi doxygenParam                guifg=#adada3 guibg=bg gui=italic
hi doxygenParamName            guifg=#9492a9 guibg=bg gui=italic
hi doxygenParamDirection       guifg=#adad87 guibg=bg gui=italic
hi doxygenArgumentWord         guifg=#9492a9 guibg=bg gui=italic
hi doxygenCodeWord             guifg=#9492a9 guibg=bg gui=italic
hi doxygenHyperLink            guifg=#9492a9 guibg=bg gui=italic
" Specific for Vim script {{{1
"hi vimCommentTitle guifg=#80ff80 guibg=bg      gui=bold term=none cterm=none ctermfg=lightgreen
"hi vimHiCtermColor guifg=#ffff60 guibg=bg      gui=none term=none cterm=none ctermfg=yellow
"hi vimFold         guifg=#888888 guibg=#222222 gui=none term=none cterm=none ctermfg=darkgrey ctermbg=grey
hi XmlEntityPunct guifg=#ff8800 guibg=bg gui=none term=none cterm=none ctermfg=darkyellow
" Spell checking {{{1
"if version >= 700
  "hi SpellBad   guisp=red    gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
  "hi SpellCap   guisp=yellow gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
  "hi SpellRare  guisp=blue   gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
  "hi SpellLocal guisp=orange gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=underline
"endif
" Cursor color for GUI {{{1
hi Cursor 	guifg=NONE    guibg=#656565 gui=none
"hi lCursor  guifg=#000000 guibg=#80ff80
"hi CursorIM guifg=#000000 guibg=#0090ff
" vim: foldmethod=marker foldmarker={{{,}}}:
