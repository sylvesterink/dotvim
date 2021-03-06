set makeprg=cmake

if has("win32") || has("win64")
    let s:dbuildcommand = "make -DCMAKE_BUILD_TYPE=Debug -G \"MinGW Makefiles\" ../../"
    let s:buildcommand = "make -DCMAKE_BUILD_TYPE=Release -G \"MinGW Makefiles\" ../../"
else
    let s:dbuildcommand = "make -DCMAKE_BUILD_TYPE=Debug -G \"Unix Makefiles\" ../../"
    let s:buildcommand = "make -DCMAKE_BUILD_TYPE=Release -G \"Unix Makefiles\" ../../"
endif

map <C-F5> : call BuildCmake()<CR>
func! BuildCmake()
  exec "wa"
  exec "cd build/debug/"
  exec s:dbuildcommand
  exec "cd ../release/"
  exec s:buildcommand
  exec "cd ../../"
endfunc

map <F6> :call CompileDebug()<CR>
func! CompileDebug()
  exec "wa"
  exec "make --build build/debug"
endfunc

map <C-F6> :call CompileRelease()<CR>
func! CompileRelease()
  exec "wa"
  exec "make --build build/release"
endfunc

echo "CPPIDE Scripts Loaded"
