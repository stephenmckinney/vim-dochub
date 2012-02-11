" jquery-doc.vim - Browse jQuery API doc
" Author:       Luca Pette <lucapette@gmail.com>
" Version:      0.1

if exists("g:loaded_jquery_doc")
  finish
endif
let g:loaded_jquery_doc = 1

if !exists('g:jquery_doc_command')
    let g:jquery_doc_command='xdg-open'
endif

if !exists('g:jquery_doc_mapping')
    let g:jquery_doc_mapping='JJ'
endif

execute "noremap <silent> ".g:jquery_doc_mapping." :call jquerydoc#search(expand('<cword>'))<CR>"

command! -narg=1 JQueryDoc call jquerydoc#search(<q-args>)
