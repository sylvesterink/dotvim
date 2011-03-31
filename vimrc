" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable the pathogen plugin
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
  if has("win32") || has("win64")
      set backupdir=~/vimbackup
      set directory=~/vimtmp
  else
      set backupdir=~/.vimbackup
      set directory=~/.vimtmp
  endif
endif
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set showmode 		" show when in insert mode
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nowrap
set sw=4 sts=4 ts=4 et  " use spaces instead of tabs

" hide toolbar
set guioptions-=T

" hide scrollbars
set guioptions-=l
set guioptions-=r
set guioptions-=b
set guioptions-=L
set guioptions-=R

" hide menu
set guioptions-=m

" Set custom color
if has("gui_running")
  colorscheme wombat "Ink
endif

" Set custom font for windows only
if has("win32") || has("win64")
    set guifont=ProggyCleanTTSZ:h12
endif

set encoding=utf8
try
    lang en_US
catch
endtry

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
"END EXAMPLE VIM FILE

" ------------------------------
" My Settings
" ------------------------------
" for compiling
" Use make as default for now.  Cmake can be activated
" via cppide script.
" set makeprg=cmake

" Use easy to read symbols for tabstops and EOLs
set listchars=tab:»\ ,eol:¬

" ------------------------------
" My Functions
" ------------------------------
"Run said command but presereve current settings
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" ------------------------------
" My Binds
" ------------------------------
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Shortcut to enable the cmake compilation commands
nmap <leader>i :ru scripts/cppide.vim<CR>

" Strip trailing whitespaces from file
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" Switch to the directory of the open buffer
nmap <leader>cd :cd %:p:h<CR>

" Open a buffer for scribble
map <leader>q :e ~/buffer<CR>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===================================================

" Insert doxygen comment for functions, classes etc
nmap <leader>d :Dox<CR>

"---------------------------------------------------
" PLUGINS
"---------------------------------------------------
" --------------------
" MiniBufExpl
" --------------------
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
let g:miniBufExplMaxSize = 2 " <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.
"let g:miniBufExplForceSyntaxEnable = 1 " There is a Vim bug that can cause buffers to show up without their highlighting. The following setting will cause MBE to
"let g:miniBufExplorerMoreThanOne = 1 " Setting this to 0 will cause the MBE window to be loaded even
let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavArrows = 1
""OLD COLORS
""for buffers that have NOT CHANGED and are NOT VISIBLE.
"highlight MBENormal guibg=#b5b39a guifg=gray40
"" for buffers that HAVE CHANGED and are NOT VISIBLE
"highlight MBEChanged guibg=#b5b39a guifg=IndianRed4
"" buffers that have NOT CHANGED and are VISIBLE
"highlight MBEVisibleNormal term=bold cterm=bold gui=bold guibg=#c2bfa5 guifg=gray20
"" buffers that have CHANGED and are VISIBLE
"highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=#c2bfa5 guifg=IndianRed4
"NEW COLORS
"for buffers that have NOT CHANGED and are NOT VISIBLE.
highlight link MBENormal NonText
" for buffers that HAVE CHANGED and are NOT VISIBLE
highlight link MBEChanged Folded
" buffers that have NOT CHANGED and are VISIBLE
highlight link MBEVisibleNormal StatusLine
" buffers that have CHANGED and are VISIBLE
highlight link MBEVisibleChanged PmenuSel

"" -------------------
"" ShowMarks
"" -------------------
"let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
"let g:showmarks_enable = 1
"" For marks a-z
"highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
"" For marks A-Z
"highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
"" For all other marks
"highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
"" For multiple marks on the same line.
"highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen

" --------------------
" TagList
" --------------------
" F4 : Switch on/off TagList
nnoremap <silent> <F4> :TlistToggle<CR>
" COLORING REMOVED FOR NOW BECAUSE I PREFER DEFAULT
" TagListTagName - Used for tag names
"highlight MyTagListTagName gui=bold guifg=Black guibg=Orange
" TagListTagScope - Used for tag scope
"highlight MyTagListTagScope gui=NONE guifg=Blue
" TagListTitle - Used for tag titles
"highlight MyTagListTitle gui=bold guifg=DarkRed guibg=LightGray
" TagListComment - Used for comments
"highlight MyTagListComment guifg=DarkGreen
" TagListFileName - Used for filenames
"highlight MyTagListFileName gui=bold guifg=Black guibg=LightBlue
"line below not needed because ctags is in path
"let Tlist_Ctags_Cmd = $VIM.'/vimfiles/ctags.exe' " location of ctags tool
"let Tlist_Show_One_File = 1 " Displaying tags for only one file~
let Tlist_Exit_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Sort_Type = "order" " sort by order or name
let Tlist_Display_Prototype = 0 " do not show prototypes and not tags in the taglist window.
let Tlist_Compact_Format = 0 " Remove extra information and blank lines from the taglist window.
let Tlist_GainFocus_On_ToggleOpen = 1 " Jump to taglist window on open.
let Tlist_Display_Tag_Scope = 1 " Show tag scope next to the tag name.
let Tlist_Close_On_Select = 0 " Close the taglist window when a file or tag is selected.
let Tlist_Enable_Fold_Column = 0 " Don't Show the fold indicator column in the taglist window.
let Tlist_WinWidth = 40
let TList_Auto_Update = 1 " When editing a file, typing :TlistUpdate will update list
" let Tlist_Ctags_Cmd = 'ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'
" very slow, so I disable this
" let Tlist_Process_File_Always = 1 " To use the :TlistShowTag and the :TlistShowPrototype commands without the taglist window and the taglist menu, you should set this variable to 1.
":TlistShowPrototype [filename] [linenumber]

" --------------------
" NERDTree
" --------------------
" F2 : Switch on/off NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeAutoCenter = 1

" --------------------
" OmniCPPComplete
" --------------------
set nocp
filetype plugin on
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4
" build tags of your own project with CTRL+F12
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <leader>t :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"omni completion simplification
set completeopt=menuone,menu,longest,preview 
"set completeopt=longest,menuone
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"The following is to use tabs and stuff to select, Codeblocks style
"!!!this needs to be tweaked, but I don't use it anyway
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"highlight Pmenu guibg=brown gui=bold
