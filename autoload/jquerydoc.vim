function! jquerydoc#search(keyword)
  let url = 'http://api.jquery.com/'.a:keyword
  exec ':silent !'.g:jquery_doc_command.' '.url.' &'
endfunction
