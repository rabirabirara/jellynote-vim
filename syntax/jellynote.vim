" Vim syntax file
" Language: JellyNote
" Maintainer: Spencer Gouw
" Latest Revision: 13 September 2020

if exists("b:current_syntax")
    finish
endif

syntax keyword jellyKeys1 true false bool
syntax keyword jellyKeys2 func fn trait impl static &str struct const async
syntax keyword jellyKeys3 let if then else var variable int integer when

" Match all JellyNote number types
" Change this later, if you want it to be embedded...
" syntax match jellyNumber "\v<\d+>"
" syntax match jellyNumber "\v<\d+\.\d+>"
" syntax match jellyNumber "\v<\d+\-\d+>"
" syntax match jellyNumber "\v<\d*\.?\d+([Ee]-?)?\d+>"
" syntax match jellyNumber "\v<0x\x+([Pp]-?)?\x+>"
" syntax match jellyNumber "\v<0b[01]+(\.\d+)?>"
" syntax match jellyNumber "\v<0o\o+>"



""" Match jellynote delimiters!

" Bolded
syntax match jellySubject 	"\v^\s*\+.*\+"
syntax match jellyTopic 	"\v^\s*\=.*$"

" Note: this is verynomagic syntax
syntax match jellyDivider "\V\^\s\*-==-"
syntax match jellyDivider "\V\^\s\*..."

syntax match jellyDash "\v^\s*\-+[^\=].*$"
syntax match jellyDash "\v^\s*\d\-+.*$"

" These should be included in jellyNote.
syntax match jellyItalic "\v\*.*\*" contained
syntax match jellyBold "\v\*{2}.*\*{2}" contained

syntax region jellyNote start="\v^\s*\:[^\:]" end="\v$" contains=jellyNumber,jellyQuote,jellyItalic,jellyBold,jellyEquation
syntax region jellyNote start="\v^\s*\d\:[^\:]" end="\v$" contains=jellyNumber,jellyQuote,jellyItalic,jellyBold
syntax region jellyList start="\v^\s*\:{2}[^\:]" end="\v$" contains=jellyNumber,jellyQuote,jellyItalic,jellyBold,jellyEquation
syntax region jellyList start="\v^\s*\:{3}" end="\v\:{3}" contains=jellyNote,jellyExample,jellyRemark,jellyObservation,jellyInquiry,jellyResponse,jellyEquation,jellyDivider,jellyWhiteboard,jellySpecify

syntax match jellyExample "\v^\s*\/[^\/].*$"
syntax match jellyExample "\v\`.*\`"
syntax match jellyExample "\v^\s*\/{2}[^\/].*$"
" One is for examples, one is for code examples
syntax region jellyWhiteboard start="\v^\s*\/{3}" end="\v\/{3}" contains=jellyObservation,jellyNote,jellyExample,jellyRemark,jellyDivider,jellyEquation,jellySpecify
syntax region jellyWhiteboard start="\v^\s*\`{3}" end="\v\`{3}"

" Make this italic
syntax match jellyRemark "\v^\s*\#+.*$"

syntax match jellySpecify "\v^\s*\*+.*$"

syntax match jellyLet "\v^\s*\|.*$"
syntax match jellyLet "\v^\s*\\\.\-\>\|.*$"
syntax match jellyLet "\v^\s*λ\.\-\>\|.*$"

syntax match jellyObservation "\v^\s*\&+.*$"
syntax match jellyReflection "\v\|\\\|.*\|\/\|"

syntax region jellyInquiry start="\v^\s*\?{2}" end="\v\;{2}" contains=jellyRemark,jellyObservation,jellyDivider
syntax region jellyInquiry start="\v^\s*\?[^\?]" end="$"
syntax region jellyResponse start="\v^\s*\>{2}" end="\v\<{2}" contains=jellyRemark,jellyObservation,jellyDivider
syntax region jellyResponse start="\v^\s*\>[^\>]" end="$"

syntax match jellyQuote "\v\".*\""

" Equations can end with EOL or with '$'
syntax match jellyEquation "\v\$[^\$][^$]*\$"
syntax match jellyEquation "\v^\s*\$[^\$].*$"
syntax region jellyEquation start="\v\s*\${2}" end="\v\${2}$" contains=jellyDivider,jellyRemark,jellyObservation,jellySpecify

" Anything other contains is bad style
syntax region jellyProblem start="\v^\s*\-\|\=\/" end="\v\\\=\|\-" contains=jellyRemark,jellyObservation,jellyDivider
syntax region jellyProblems start="\v^\s*\-\|\={2}\/" end="\v\\\={2}\|\-" contains=jellyRemark,jellyObservation,jellyInquiry,jellyResponse,jellyDivider

" usually indent after nesting for && and ##


""" Highlight jellynote delimiters!
" Normal,Title,Number/SpecialChar,Type,Operator
" Comment,Constant,Special,Statement,PreProc,Underlined,Ignore,Todo,Character,Function,Conditional,Repeat,Label,Keyword
" Link # to italic of some kind!
" Link subject, topic, divider to bold

hi def link jellySubject		Underlined
hi def link jellyTopic			Title
hi def link jellyDivider		Title
hi def link jellyDash			Function
hi def link jellyNote 			Normal
hi def link jellyList 			Normal	" should be off-normal
hi def link jellyExample		Operator
hi def link jellyWhiteboard		Operator
hi def link jellyRemark			Special
hi def link jellySpecify        Special
hi def link jellyLet			Character
hi def link jellyObservation	MoreMsg
hi def link jellyReflection 	Grey
hi def link jellyInquiry		Conditional
hi def link jellyResponse		Conditional
hi def link jellyQuote			String
hi def link jellyEquation		Number
hi def link jellyProblem		Debug
hi def link jellyNumber			Number

let b:current_syntax = "jellynote"
