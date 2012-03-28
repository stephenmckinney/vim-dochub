" dochub.vim - Search DocHub docs
" Author:       Steve McKinney <stevemckinney@gmail.com>
" Version:      0.1
" TODO: Add command to search documentation for arbitrary stuff
" TODO: Finalize dochub_command
" TODO: Fix README
" TODO: Fix docs
" TODO: How can we have multiple types of documentation for each filetype?
" TODO: Tidy up augroups and stuff

if exists("g:loaded_dochub")
  finish
endif
let g:loaded_dochub = 1

if !exists('g:dochub_command')
    "let g:dochub_command='xdg-open'
    let g:dochub_command='open'
endif

if !exists('g:dochub_mapping')
    let g:dochub_mapping='<C-H>'
endif

let s:filetypeMap = {
    \ 'css': 'css',
    \ 'erb': 'html',
    \ 'html': 'html',
    \ 'htmldjango': 'html',
    \ 'javascript': 'javascript',
    \ 'php': 'php',
    \ 'python': 'python'
    \ }

augroup dochubEnablers
    "if the user enters a buffer or reads a buffer then setup docs
    autocmd BufEnter,BufRead * :call s:SetUpForNewFiletype(&filetype, 0)

    "if the filetype of a buffer changes, force the script to reset
    autocmd Filetype * :call s:SetUpForNewFiletype(&filetype, 1)
augroup END


" Function: s:SetUpForNewFiletype(filetype) function {{{2
" This function is responsible for setting up buffer scoped variables for the
" given filetype.
"
" Args:
"   -filetype: the filetype to set delimiters for
"   -forceReset: 1 if the delimiters should be reset if they have already be
"    set for this buffer.
"
function s:SetUpForNewFiletype(filetype, forceReset)
    if has_key(s:filetypeMap, a:filetype)
      execute "noremap <silent> ".g:dochub_mapping." :call dochub#search('".s:filetypeMap[a:filetype]."',expand('<cword>'))<CR>"
    endif
endfunction

"command! -narg=1 JQueryDoc call jquerydoc#search(<q-args>)
