set makeprg=cmake

map <F5> : call BuildDebugCmake()<CR>
func! BuildDebugCmake()
  exec "wa"
  exec "cd bin/debug/"
  exec "make -DCMAKE_BUILD_TYPE=Debug -G \"MinGW Makefiles\" ../../"
  exec "cd ../../"
endfunc

map <C-F5> : call BuildCmake()<CR>
func! BuildCmake()
  exec "wa"
  exec "cd bin/release/"
  exec "make -DCMAKE_BUILD_TYPE=Release -G \"MinGW Makefiles\" ../../"
  exec "cd ../../"
endfunc

map <F6> :call CompileDebugCmake()<CR>
func! CompileDebugCmake()
  exec "wa"
  exec "make --build bin/debug"
endfunc

map <C-F6> :call CompileReleaseCmake()<CR>
func! CompileReleaseCmake()
  exec "wa"
  exec "make --build bin/release"
endfunc

echo "CPPIDE Scripts Loaded"
