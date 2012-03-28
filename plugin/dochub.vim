" dochub.vim - Search DocHub docs
" Author:       Steve McKinney <stevemckinney@gmail.com>
" Version:      0.1

if exists("g:loaded_dochub")
  finish
endif
let g:loaded_dochub = 1

if !exists('g:dochub_command')
    "let g:dochub_command='xdg-open'
    let g:dochub_command='open'
endif

" Mappings

if !exists('g:dochub_css_mapping')
    let g:dochub_css_mapping='CC'
endif

if !exists('g:dochub_dom_mapping')
    let g:dochub_dom_mapping='DD'
endif

if !exists('g:dochub_html_mapping')
    let g:dochub_html_mapping='HH'
endif

if !exists('g:dochub_jquery_mapping')
    let g:dochub_jquery_mapping='JJ'
endif

if !exists('g:dochub_js_mapping')
    let g:dochub_js_mapping='JS'
endif

if !exists('g:dochub_php_mapping')
    let g:dochub_php_mapping='PH'
endif

if !exists('g:dochub_python_mapping')
    let g:dochub_python_mapping='PP'
endif

execute "noremap <silent> ".g:dochub_css_mapping." :call dochub#search('css',expand('<cword>'))<CR>"
execute "noremap <silent> ".g:dochub_dom_mapping." :call dochub#search('dom',expand('<cword>'))<CR>"
execute "noremap <silent> ".g:dochub_html_mapping." :call dochub#search('html',expand('<cword>'))<CR>"
execute "noremap <silent> ".g:dochub_jquery_mapping." :call dochub#search('jquery',expand('<cword>'))<CR>"
execute "noremap <silent> ".g:dochub_js_mapping." :call dochub#search('javascript',expand('<cword>'))<CR>"
execute "noremap <silent> ".g:dochub_php_mapping." :call dochub#search('php',expand('<cword>'))<CR>"
execute "noremap <silent> ".g:dochub_python_mapping." :call dochub#search('python',expand('<cword>'))<CR>"

"command! -narg=1 JQueryDoc call jquerydoc#search(<q-args>)
