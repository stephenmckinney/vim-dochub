" dochub.vim - Search API documentation quickly
" Author:       Steve McKinney <stevemckinney@gmail.com>
" Version:      0.1

if exists("g:loaded_dochub")
  finish
endif
let g:loaded_dochub = 1

if !exists('g:dochub_command')
  if has('mac')
    let g:dochub_command='open'
  elseif has('macunix')
    let g:dochub_command='open'
  else
    let g:dochub_command='xdg-open'
  endif
endif

if !exists('g:dochub_mapping')
    let g:dochub_mapping='JJ'
endif
if !exists('g:dochub_dom_mapping')
    let g:dochub_dom_mapping='JD'
endif
if !exists('g:dochub_jquery_mapping')
    let g:dochub_jquery_mapping='JQ'
endif

let s:ft_to_doc_map = {
    \ 'css'        : ['css'],
    \ 'eruby'      : ['html'],
    \ 'html'       : ['html'],
    \ 'htmldjango' : ['html'],
    \ 'javascript' : ['javascript'],
    \ 'php'        : ['php'],
    \ 'python'     : ['python'],
    \ 'scss'       : ['css'],
    \ }

let s:doc_to_api_map = {
    \ 'css'                : 'dochub',
    \ 'dom'                : 'dochub',
    \ 'html'               : 'dochub',
    \ 'javascript'         : 'dochub',
    \ 'jquery'             : 'dochub',
    \ 'php'                : 'dochub',
    \ 'python'             : 'dochub',
    \ }

augroup dochubEnablers
    "if the user enters a buffer or reads a buffer then setup docs
    autocmd BufEnter,BufRead * :call s:SetUpForNewFiletype(&filetype, 0)

    "if the filetype of a buffer changes, force the script to reset
    autocmd Filetype * :call s:SetUpForNewFiletype(&filetype, 1)
augroup END

function! s:execute(cmd)
  let cmd = a:cmd
  if has("gui_win32")
    exe "!start ".cmd
  elseif !has("gui_running")
    silent exe '!'.cmd.' 2>&1 > /dev/null'
    exec ':redraw!'
  else
    exe '!'.cmd.' 2>&1 > /dev/null &'
  endif
  return v:shell_error
endfunction

" Example: http://dochub.io/#css/background
function! s:Searchdochub(doc_type, keyword)
  let url = '"http://dochub.io/\#'.a:doc_type.'/'.a:keyword.'"'
  call s:execute(g:dochub_command.' '.url)
endfunction

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
    if has_key(s:ft_to_doc_map, a:filetype)
      let b:doc_type = s:ft_to_doc_map[a:filetype][0]
      if has_key(s:doc_to_api_map, b:doc_type)
        let b:api= s:doc_to_api_map[b:doc_type]
        execute "noremap <silent> ".g:dochub_mapping." :call <SID>Search".b:api."('".b:doc_type."',expand('<cword>'))<CR>"
        execute "noremap <silent> ".g:dochub_dom_mapping." :call <SID>Search".b:api."('dom',expand('<cword>'))<CR>"
        execute "noremap <silent> ".g:dochub_jquery_mapping." :call <SID>Search".b:api."('jquery',expand('<cword>'))<CR>"
      endif
    endif
endfunction

