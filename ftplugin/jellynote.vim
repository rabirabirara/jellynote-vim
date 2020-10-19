" ftplugin/jellynote.vim
if exists('b:jellynote_ftplugin')
    finish
else
    let b:jellynote_ftplugin = 1
endif

" setlocal comments="nbf:&,sr:|\|,mb:\|,e:|/|"

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
