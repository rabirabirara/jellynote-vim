" Vim color file
" Maintainer:	Bohdan Vlasyuk <bohdan@vstu.edu.ua>
" Last Change:	2008 Jul 18

" darkblue -- for those who prefer dark background
" [note: looks bit uglier with come terminal palettes,
" but is fine on default linux console palette.]

" jellydarkblue -- literally darkblue but for jellynote.

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "jellydarkblue"

" The background.
hi Normal ctermbg=4 guibg=#000030

hi jellySubject		    cterm=bold,underline ctermfg=169 gui=bold,underline guifg=#d75faf guisp=#d75faf
hi jellyTopic		    cterm=bold   ctermfg=208 gui=bold guifg=#ff8700
hi jellyDivider		    cterm=bold   ctermfg=208 gui=bold guifg=#ff8700
hi jellyDash			ctermfg=220  guifg=#ffd700
hi jellyItalic		    cterm=italic gui=italic
hi jellyBold			cterm=bold   gui=bold
hi jellyNote 		    ctermfg=253  guifg=#dadada
hi jellyList 		    ctermfg=195  guifg=#d7ffff
hi jellyExample		    ctermfg=159  guifg=#afffff		" match with v
hi jellyCode		    ctermfg=159  guifg=#afffff		" match with v
hi jellyWhiteboard	    ctermfg=80   guifg=#5fd7d7		" match with ^
hi jellyRemark		    cterm=italic ctermfg=191 gui=italic guifg=#d7ff5f
hi jellyRecall          ctermfg=81   guifg=#5fd7ff
hi jellySpecify		    ctermfg=31   guifg=#0087af
hi jellySummarize	    ctermfg=225  guifg=#ffd7ff gui=italic
hi jellySpeak		    ctermfg=117  guifg=#87d7ff
hi jellyLet			    ctermfg=173  guifg=#d7875f
hi jellyObservation	    ctermfg=35   guifg=#00af5f		" darken
hi jellyReflection 	    ctermfg=61   guifg=#5f5faf
hi jellyInquiry		    ctermfg=111  guifg=#87afff
hi jellyResponse		ctermfg=69   guifg=#5f87ff		" brighten
hi jellyQuote		    ctermfg=153  guifg=#afd7ff
hi jellyLink		    cterm=underline gui=underline ctermfg=45 guifg=#00d7ff guisp=#00d7ff
hi jellyEquation		ctermfg=84   guifg=#5fff87 		" dim
hi jellyProblem		    ctermfg=182  guifg=#d7afd7
hi jellyProblems		ctermfg=182  guifg=#d7afd7
hi jellyNumber		    ctermfg=69   guifg=#5f87ff
