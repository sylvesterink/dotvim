
"remove the extraneous lines
:map <F3> :g!/^<Conv>.*$/ d<Enter>:noh<Enter>

"replace the end of each line with a line break, remove <Conv>
:map <F4> :%s/<\/Conv>/<br>/g<Enter>:%s/<Conv>//g<Enter>

"format the location
:map <F5> :%s/^\[.*\]/<div class="location">&<\/div>/g<Enter>:noh<Enter>

"format Glugg
:map <F6> :%s/Goreglugg O'Winstershire:/<div class="glugg">&<\/div>/g<Enter>:noh<Enter>

"format Railla
:map <F7> :%s/Railla Fyne:/<div class="railla">&<\/div>/g<Enter>:noh<Enter>

"format Willard
:map <F8> :%s/Willard Bassilar:/<div class="will">&<\/div>/g<Enter>:noh<Enter>

"format DM 
:map <F9> :%s/Dunge Onmaster.\{-1,}:/<div class="dm">&<\/div>/g<Enter>:noh<Enter>

"format NPCs
:map <F10> :%s/ :/<div class="npc">&<\/div>/g<S-Left><S-Left><BS>

"insert the header and footer html
:map <F11> gg:0r logheader.html<Enter>Go</body><Enter></html><Esc>gg/Session<Enter>:noh<Enter>wdei

"insert caption
:map <F12> o<Enter><br><div class="captions">*** ***</div><Esc>bbgea 

