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

" NOTE: VERYNOMAGIC
syntax match jellyDivider "\V\^\s\*-==-"
syntax match jellyDivider "\V\^\s\*..."

syntax match jellyDash "\v^\s*\-+[^\=].*$"
syntax match jellyDash "\v^\s*\d\-+.*$"

" These should be included in jellyNote.
syntax match jellyItalic "\v\*.*\*" contained
syntax match jellyBold "\v\*{2}.*\*{2}" contained

syntax region jellyNote start="\v^\s*\:[^\:]" end="\v$" contains=jellyNumber,jellyQuote,jellyItalic,jellyBold,jellyEquation,jellyCode
syntax region jellyNote start="\v^\s*\d\:[^\:]" end="\v$" contains=jellyNumber,jellyQuote,jellyItalic,jellyBold,jellyEquation,jellyCode
syntax region jellyList start="\v^\s*\:{2}[^\:]" end="\v$" contains=jellyNumber,jellyQuote,jellyItalic,jellyBold,jellyEquation,jellyCode
syntax region jellyList start="\v^\s*\:{3}" end="\v\:{3}" contains=jellyNote,jellyExample,jellyRemark,jellyObservation,jellyInquiry,jellyResponse,jellyEquation,jellyDivider,jellyWhiteboard,jellySpecify,jellyLet,jellyQuote,jellyCode,jellyRecall

syntax region jellyExample start="\v^\s*\/{1,2}[^\/]" end="\v$"

" One is for examples, one is for code examples
" convenient that syntax regions can contain themselves
syntax region jellyWhiteboard start="\v^\s*\/{3}" end="\v\/{3}" contains=jellyObservation,jellyNote,jellyExample,jellyRemark,jellyDivider,jellyEquation,jellySpecify
syntax region jellyWhiteboard start="\v^\s*\`{3}" end="\v\`{3}"

" Make this italic
syntax match jellyRemark "\v^\s*\#+.*$"

" Inner has two space indents.
" NOTE: verynomagic.
syntax region jellyRecall start="\V\^\s\*@" end="\V@" contains=jellyObservation,jellyNote,jellyExample,jellyRemark,jellyDivider,jellyEquation,jellySpecify,jellyLet,jellyQuote,jellyInquiry,jellyResponse,jellySpecify

syntax match jellySpecify "\v^\s*\*+.*$"
syntax match jellySummarize "\v^\s*\%+.*$"
" somewhat discourage the overuse of jellySpeak.  causes you to just rewrite
" verbatim from the text
syntax match jellySpeak "\v^\s*\~+.*$"

syntax match jellyLet "\v^\s*\|.*$"
syntax match jellyLet "\v^\s*\\\.\-\>\|.*$"
syntax match jellyLet "\v^\s*λ\.\-\>\|.*$"

syntax match jellyObservation "\v^\s*\&+.*$"

" at this point, it's used more like jellyScroll than jellyReflection.
syntax match jellyReflection "\v^\s*\|\\\|.*\|\/\|"
syntax match jellyReflection "\v^\s*\|\/\|.*\|\\\|"

syntax region jellyInquiry start="\v^\s*\?{2}" end="\v\;{2}" contains=jellyRemark,jellyObservation,jellyDivider
syntax region jellyInquiry start="\v^\s*\?[^\?]" end="$"
syntax region jellyResponse start="\v^\s*\>{2}" end="\v\<{2}" contains=jellyRemark,jellyObservation,jellyDivider
syntax region jellyResponse start="\v^\s*\>[^\>]" end="$"

syntax region jellyQuote start="\v\"" end="\v\""

syntax region jellyLink start="\v\{" end="\v\}"

syntax region jellyCode start="\v\`" end="\v\`"

" Equations can end with EOL or with '$'
syntax match jellyEquation "\v\$[^\$][^$]*\$" 
syntax match jellyEquation "\v^\s*\$[^\$].*$"
syntax region jellyEquation start="\v\s*\${2}" end="\v\${2}$" contains=jellyDivider,jellyRemark,jellyObservation,jellySpecify

" Anything other contains is bad style * what does this comment mean??
syntax region jellyProblem start="\v^\s*\-\|\=\/" end="\v\\\=\|\-" contains=jellyRemark,jellyObservation,jellyDivider
syntax region jellyProblems start="\v^\s*\-\|\={2}\/" end="\v\\\={2}\|\-" contains=jellyRemark,jellyObservation,jellyInquiry,jellyResponse,jellyDivider

" usually indent after nesting for && and ##


let b:current_syntax = "jellynote"
