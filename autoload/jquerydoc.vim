function! s:execute(cmd)
  let cmd = a:cmd
  if has("gui_win32")
    exe "!start ".cmd
  elseif !has("gui_running")
    silent exe '!'.cmd.' 2>&1 > /dev/null'
    exec ':redraw!'
  else
    silent exe '!'.cmd.' 2>&1 > /dev/null &'
  endif
  return v:shell_error
endfunction

function! jquerydoc#search(keyword)
  let url = 'http://api.jquery.com/'.a:keyword
  call s:execute(g:jquery_doc_command.' '.url)
endfunction
