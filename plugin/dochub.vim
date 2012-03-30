" dochub.vim - Search DocHub docs
" Author:       Steve McKinney <stevemckinney@gmail.com>
" Version:      0.1
" TODO: Fix README
" TODO: Fix vim documentation
" TODO: How can we have multiple types of documentation for each filetype? 
" mappings like RR=rails, RS=rspec, JD=dom, JJ=jquery, RD=rubydoc, PD=django
" TODO: Add command to search documentation for arbitrary stuff
" TODO: Think about using xdg-open for linux and Windoze
" TODO: Add Django support, Python support that doesn't suck

if exists("g:loaded_dochub")
  finish
endif
let g:loaded_dochub = 1

if !exists('g:dochub_command')
    "
    let g:dochub_command='open'
endif

if !exists('g:dochub_mapping')
    let g:dochub_mapping='HH'
endif

let s:ft_to_doc_map = {
    \ 'css'        : ['css'],
    \ 'erb'        : ['html', 'rails'],
    \ 'html'       : ['html'],
    \ 'htmldjango' : ['html'],
    \ 'javascript' : ['javascript', 'jquery', 'dom'],
    \ 'php'        : ['php', 'html'],
    \ 'python'     : ['python'],
    \ 'ruby'       : ['ruby', 'rails', 'rspec-core', 'rpec-expectations', 'rspec-mocks']
    \ }

let s:doc_to_api_map = {
    \ 'css'                : 'dochub',
    \ 'dom'                : 'dochub',
    \ 'html'               : 'dochub',
    \ 'javascript'         : 'dochub',
    \ 'jquery'             : 'dochub',
    \ 'php'                : 'dochub',
    \ 'python'             : 'dochub',
    \ 'ruby'               : 'ruby',
    \ 'rails'              : 'rubyonrails',
    \ 'rspec-core'         : 'rubydoc',
    \ 'rspec-expectations' : 'rubydoc',
    \ 'rspec-mocks'        : 'rubydoc'
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

" Example: https://www.google.com/search?ie=UTF-8&q=map+site%3Awww.ruby-doc.org
function! s:Searchruby(doc_type, keyword)
  let url = '"https://www.google.com/search?ie=UTF-8&q='.a:keyword.'+site%3Awww.ruby-doc.org"'
  call s:execute(g:dochub_command.' '.url)
endfunction

" Examples:
" http://rubydoc.info/search/gems/rspec-mocks?q=should_receive
function! s:Searchrubydoc(doc_type, keyword)
  let url = '"http://rubydoc.info/search/gems/'.a:doc_type.'?q='.a:keyword.'"'
  call s:execute(g:dochub_command.' '.url)
endfunction

" Example: http://api.rubyonrails.org/?q=has_many
function! s:Searchrubyonrails(doc_type, keyword)
  let url = '"http://api.rubyonrails.org/?q='.a:keyword.'"'
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
      endif
    endif
endfunction

