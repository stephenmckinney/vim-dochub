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

function! dochub#search(type, keyword)
  let url = 'http://dochub.io/\\#'.a:type.'/'.a:keyword
  call s:execute(g:dochub_command.' '.url)
endfunction
