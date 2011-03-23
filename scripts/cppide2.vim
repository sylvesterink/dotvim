set makeprg=make

map <F5> : call CompileGcc()<CR>
func! CompileGcc()
  exec "w"
  exec "!g++ -Wall -s -O2 % -o %<"
endfunc

map <F6> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  exec "!g++ -Wall -s -O2 % -o %<"
  exec "! %<"
  "exec \"! ./%<\"  for linux (remove forward slashes)
endfunc

echo "CPPIDE2 Scripts Loaded"
