"------------------------------------------------------------------------------"
" Base settings
"------------------------------------------------------------------------------"
" Do a :help <topic> to learn more
"------------------------------------------------------------------------------"
set ruler
set hlsearch
set laststatus=2
set showcmd
set number
set title
set expandtab
set tabstop=4
set shiftwidth=4
set cindent
set cinkeys=0{,0},0),:,!^F,o,O,e
set fo=tcrq
set comments=sr:/*,mb:*,elx:*/
set hid
set backup
set backspace=indent,eol,start
"set makeprg=make\ %<.o
set dictionary=/usr/share/dict/american-english
let Tlist_Use_Right_Window=1
"set textwidth=80
"set ignorecase
"set equalprg=sort
"set nocp
"set report=0
"set showmode
"set esckeys
"set showmatch
"set sm
"set et

"------------------------------------------------------------------------------"
" Operating System Specific
"------------------------------------------------------------------------------"
set backupdir=~/backup/
set shell=bash

"------------------------------------------------------------------------------"
" Visual Studio Integration
"------------------------------------------------------------------------------"
if has("win32")
	set autowrite
	"setlocal errorformat=\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
	"setlocal makeprg=devenv\ c:/Projects/MySolution.sln\ -build\ release
endif 

"------------------------------------------------------------------------------"
" Gvim Settings
"------------------------------------------------------------------------------"
set guifont="Bitstrem Vera Sans Mono 10"
color slate
syn on

"------------------------------------------------------------------------------"
" Actions for reading binary files
"------------------------------------------------------------------------------"
" The following commands are executed before the file is opened and the output
" is directed to vim.  Note, these files cannot be edited, only saved as the 
" output is not a real file, only a buffer.
"------------------------------------------------------------------------------"
augroup binaries
autocmd BufReadPost *.ps  silent %!ps2ascii "%"
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
autocmd BufReadPost *.doc silent %!antiword "%"
autocmd BufReadPost *.a   silent %!nm "%"
augroup END


"------------------------------------------------------------------------------"
" Omnicomplete setup
"------------------------------------------------------------------------------"
" To use omnicomplete, simply begin typing a reserved word, then hit <C-x><C-o>
" This could also be achieved with:
" setlocal omnifunc=syntaxcomplete#Complete
"------------------------------------------------------------------------------"
augroup omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP | execute "compiler php"
autocmd FileType c set omnifunc=ccomplete#Complete | execute "compiler gcc"
autocmd FileType java execute "compiler java"
autocmd FileType perl execute "compiler perl"
augroup END

"------------------------------------------------------------------------------"
" Set up compiler and move to directory
"------------------------------------------------------------------------------"
autocmd BufEnter * :cd %:p:h
"au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry

"------------------------------------------------------------------------------"
" Delete fix
"------------------------------------------------------------------------------"
" This remaps keys to values so that delete and backspace work correctly
"------------------------------------------------------------------------------"
fixdel
set t_kD=
set t_kb=

"------------------------------------------------------------------------------"
" Colors
"------------------------------------------------------------------------------"
" This is not really needed, it simply overrides the default theme to make the
" comments Dark gray and the comments light blue.  The next part however, is
" used to assign syntax highlighting to uncommon filetypes.
"------------------------------------------------------------------------------"
if has("win32")
else
	so ${VIMRUNTIME}/syntax/syntax.vim
	hi LineNr ctermfg=DarkGray
	hi Comment ctermfg=LightBlue
endif

augroup syntaxset
autocmd BufRead,BufNewFile *.pde set filetype=c
autocmd BufRead,BufNewFile *.nc set filetype=c
augroup END

"------------------------------------------------------------------------------"
" Abbreviations
"------------------------------------------------------------------------------"
" These are a few shortcuts I find handy.  Simply type the first part and then
" hit space
"------------------------------------------------------------------------------"
ab #l #---------------------------------------------------------------------------#
augroup block-comment
autocmd BufRead,BufNewFile *.c,*.h ab #l //---------------------------------------------------------------------------//
autocmd BufRead,BufNewFile *.cpp,*.hpp ab #l //---------------------------------------------------------------------------//
autocmd BufRead,BufNewFile *.vim* ab #l "---------------------------------------------------------------------------"
augroup END

ab FoR for(i=0; i<=; i++){}
ab #d #define
ab #i #include
ab #r return(0);
"ab pr printf("");<Left><Left><Left>
"ab cw Console.Write("");<Left><Left><Left>
":ab if if( ){<Left><Left><Left>

"------------------------------------------------------------------------------"
" Vim Tab Mappings
"------------------------------------------------------------------------------"
" New Tab
map  <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
cmap <C-t> <Esc><Esc>:tabnew<CR>
" Close Tab
map  <C-q> :tabclose<CR>
imap <C-q> <Esc>:tabclose<CR>
cmap <C-q> <Esc><Esc>:tabclose<CR>
" Next Tab
map  <C-Tab> :tabn<CR>
imap <C-Tab> <Esc>:tabn<CR>
cmap <C-Tab> <Esc><Esc>:tabn<CR>
" Previous Tab
map  <C-S-Tab> :tabp<CR>
imap <C-S-Tab> <Esc>:tabp<CR>
cmap <C-S-Tab> <Esc><Esc>:tabp<CR>

"------------------------------------------------------------------------------"
" Key Mappings
"------------------------------------------------------------------------------"
" Personal preference
"------------------------------------------------------------------------------"
" Switch visual keys
nnoremap v <C-v>
nnoremap <C-v> v

" Switch search forward/backward
nnoremap n N
nnoremap N n

" Fix My Bad Typing
nmap :W   :w!
nmap :WQ  :wq!
nmap :Q   :q!
nmap :chp :checkpath
nmap :html :!links file://%:p <CR>

"------------------------------------------------------------------------------"
" For Win32 version, have "K" lookup the keyword in a help file
"------------------------------------------------------------------------------"
if has("win32")
  let winhelpfile='windows.hlp'
  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
endif

"------------------------------------------------------------------------------"
" Quick Functions
"------------------------------------------------------------------------------"
" F1 -> Help
" F2 -> Save
map  <F2> :w<CR>
imap <F2> <ESC>:w<CR>
cmap <F2> <ESC><ESC>:w<CR>

" F3 -> Save and Exit
map  <F3> :wq!<CR>
imap <F3> <ESC>:wq!<CR>
cmap <F3> <ESC><ESC>:wq!<CR>

" F4 -> Exit
map  <F4> :q!<CR>
imap <F4> <ESC>:q!<CR>
cmap <F4> <ESC><ESC>:q!<CR>

" F5 -> Compile File
map  <F5> :make %<CR>
imap <F5> <ESC>:make %<CR>
cmap <F5> <ESC><ESC>:make %<CR>

" F6 -> File Explorer
map  <F6> :Vexplore<CR>
imap <F6> <ESC>:Vexplore<CR>
cmap <F6> <ESC><ESC>:Vexplore<CR>

" F7 -> Buffer List
map  <F7> :w!<CR>:ls<CR>:e #
imap <F7> <ESC>:w!<CR>:ls<CR>:e #
cmap <F7> <ESC><ESC>:w!<CR>:ls<CR>:e #

" F7 -> Quick Shell
"map  <F7> :sh<CR>
"imap <F7> <ESC>:sh<CR>
"cmap <F7> <ESC><ESC>:sh<CR>

" F9 -> Taglist
map  <F9> :Tlist<CR>
imap <F9> <ESC>:Tlist<CR>
cmap <F9> <ESC><ESC>:Tlist<CR>

" F10 -> Taglist Sync
map  <F10> :TlistSync<CR>
imap <F10> <ESC>:TlistSync<CR>
cmap <F10> <ESC><ESC>:TlistSync<CR>

" F11 -> Hex Editor
map  <F11> :call Hex()<CR>
imap <F11> <ESC>:call Hex()<CR>
cmap <F11> <ESC><ESC>:call Hex()<CR>

" F12 -> Quick Replace
map  <F12> :call Replace()<CR>
imap <F12> <ESC>:call Replace()<CR>
cmap <F12> <ESC><ESC>:call Replace()<CR>

"------------------------------------------------------------------------------"
" Functions
"------------------------------------------------------------------------------"

"------------------------------------------------------------------------------"
" Quick c-style comment
"------------------------------------------------------------------------------"
fun! QComment()
	:exe ':s//\/\//g'
endfun

"------------------------------------------------------------------------------"
" Quick c-style uncomment
"------------------------------------------------------------------------------"
fun! QUnComment()
	:exe ':s/\/\///g'
endfun

"------------------------------------------------------------------------------"
" Quick replace of word under curser
"------------------------------------------------------------------------------"
fun! Replace()
	let s:word = input("Replace '".expand('<cword>')."' With: ")
	if s:word != ""
		:exe '%s/'.expand('<cword>').'/'.s:word.'/ge'
		:unlet! s:word
	endif
endfun

"------------------------------------------------------------------------------"
" Toggle hex editor
"------------------------------------------------------------------------------"
fun! Hex()
	if (exists ("s:hex"))
		:unlet! s:hex
		:%!xxd -r
	else
		let s:hex = "true"
		:%!xxd
	endif
endfun

"------------------------------------------------------------------------------"
" Rotate 13 an entire file
"------------------------------------------------------------------------------"
fun! Rot13()
	if (exists ("s:rot"))
		:unlet! srot:
		execute "normal \<Esc>ggg?G"
	else
		let s:rot = "true"
		execute "normal \<Esc>ggg?G"
	endif
endfun

"------------------------------------------------------------------------------"
" CScope
"------------------------------------------------------------------------------"
" Just a quick check to see if csope should be used or not
"------------------------------------------------------------------------------"
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" If Current Database
	if filereadable("cscope.out")
		cs add cscope.out
	" else add database
	elseif $CSOPE_DB != ""
		cs add $CSOPE_DB
	endif
	set csverb
endif

"------------------------------------------------------------------------------"
" CScope Key Mappings
"------------------------------------------------------------------------------"
" These are usually flakey at best, but maybe you will have better luck than I
" have had.
"------------------------------------------------------------------------------"
""0 or s: Find this C symbol
nmap <C-\>s :scs find s <C-R>=expand("<cword>")<CR><CR>
""1 or g: Find this definition
nmap <C-\>g :scs find g <C-R>=expand("<cword>")<CR><CR>
""2 or d: Find functions called by this function
nmap <C-\>d :scs find d <C-R>=expand("<cword>")<CR><CR>
""3 or c: Find functions calling this function
nmap <C-\>c :scs find c <C-R>=expand("<cword>")<CR><CR>
""4 or t: Find this text string
nmap <C-\>t :scs find t <C-R>=expand("<cword>")<CR><CR>
""6 or e: Find this egrep pattern
nmap <C-\>e :scs find e <C-R>=expand("<cword>")<CR><CR>
""7 or f: Find this file
nmap <C-\>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
""8 or i: Find files #including this file
nmap <C-\>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
