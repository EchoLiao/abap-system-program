let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <F9> :InsPrevHita
imap <F8> :InsNextHita
imap <M-l> :BuildMenua
imap <M-j> :popup PopUpa
imap <F5> :PreviewClassa
inoremap <silent> <Plug>NERDCommenterInInsert  <BS>:call NERDComment(0, "insert")
cnoremap <C-F4> c
inoremap <C-F4> c
cnoremap <C-Tab> w
inoremap <C-Tab> w
cnoremap <M-Space> :simalt ~
inoremap <M-Space> :simalt ~
cmap <S-Insert> +
imap <S-Insert> 
xnoremap  ggVG
snoremap  gggHG
onoremap  gggHG
nnoremap  gggHG
vnoremap  "+y
nmap <silent>  :exe "C c"
noremap  
nmap <silent>  :exe "C n"
noremap  :close
vnoremap  :update
nnoremap  :update
onoremap  :update
nmap  :pwd
nmap  "+gP
omap  "+gP
nmap o <Plug>ZoomWin
vnoremap  "+x
nmap d :cs find d =expand("<cword>")
nmap i :cs find i ^=expand("<cfile>")$
nmap f :cs find f =expand("<cfile>")
nmap e :cs find e =expand("<cword>")
nmap t :cs find t =expand("<cword>")
nmap c :cs find c =expand("<cword>")
nmap g :cs find g =expand("<cword>")
nmap s :cs find s =expand("<cword>")
vmap <silent> ,dep mzomyo:s/  *$//ge`zV`y:s/^	*$//ge
map <silent> ,ct $F l,c$k$2F l
nmap <silent> ,dep :%s/  *$//ge:%s/^	*$//ge
omap <silent> ,dep :%s/  *$//ge:%s/^	*$//ge
map <silent> ,gu mzggVG~`z
map ,mbt <Plug>TMiniBufExplorer
map ,mbu <Plug>UMiniBufExplorer
map ,mbc <Plug>CMiniBufExplorer
map ,mbe <Plug>MiniBufExplorer
nmap <silent> ,c <Plug>MarkClear
vmap <silent> ,r <Plug>MarkRegex
nmap <silent> ,r <Plug>MarkRegex
vmap <silent> ,m <Plug>MarkSet
nmap <silent> ,m <Plug>MarkSet
map ,, <Plug>FindMate
nmap ,caL <Plug>CalendarH
nmap ,cal <Plug>CalendarV
nmap <silent> ,ucs :call C_RemoveGuiMenus()
nmap <silent> ,lcs :call C_CreateGuiMenus()
nmap <silent> ,bv :VSBufExplorer
nmap <silent> ,bs :HSBufExplorer
nmap <silent> ,be :BufExplorer
nmap ,a <Plug>ToggleAutoCloseMappings
nmap ,ihn :IHN
nmap ,is :IHS:A
nmap ,ih :IHS
nmap ,ca <Plug>NERDCommenterAltDelims
vmap ,cA <Plug>NERDCommenterAppend
nmap ,cA <Plug>NERDCommenterAppend
vmap ,c$ <Plug>NERDCommenterToEOL
nmap ,c$ <Plug>NERDCommenterToEOL
vmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
vmap ,cn <Plug>NERDCommenterNest
vmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
vmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cl <Plug>NERDCommenterAlignLeft
vmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
vmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
vmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
vmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
vmap ,c  <Plug>NERDCommenterToggle
nmap ,c  <Plug>NERDCommenterToggle
vmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
map ,jc :call DatabaseCreate ()
map ,jst :call ShowSetupEvnironmentWindow('tags')
map ,jsc :call ShowSetupEvnironmentWindow('cscope')
map <silent> ,q mz:set noai:set fo+=MmV:s/   *//geV:s/	*/\1/geVgq:set ai/<Up><Up><Up>`z
map <silent> ,sfo :set fo+=Mm
map <silent> ,lhd oI#ifdef  _NAL_HDEBUG_o#elseo#endif
map <silent> ,hh [[
map <silent> ,g %
map <silent> ,bab i{$a}
map <silent> ,bam i[$a]
map <silent> ,bas i($a)
map <silent> ,eab i{ea}
map <silent> ,eam i[ea]
map <silent> ,eas i(ea)
map <silent> ,date :r ! dateI(A)oi#77a=0
map <silent> ,v2h :source $VIMRUNTIME/syntax/2html.vim
map <silent> ,tof V:s/\\/\//g
map <silent> ,cos :%s//&/gn
map <silent> ,col :%s/^//n
map <silent> ,cow :%s/\i\+/&/gn
map <silent> ,coc :%s/./&/gn
map <silent> ,anu :%s/^/\=line(".")." "/g
map <silent> ,dsp :g/^$/d
map <silent> ,sor :!sort
map <silent> ,sfl :.,/^$/-1!sort
map <silent> ,dfg $bhde
map <silent> ,afg A @@@@@
map <silent> ,vne :vnew
map <silent> ,vnw :vsplit
map <silent> ,new :new
map <silent> ,onl :only
map <silent> ,clo :close
map <silent> ,nww :split
noremap <silent> ,sl l
noremap <silent> ,sj j
noremap <silent> ,sk k
noremap <silent> ,sh h
noremap <silent> ,mq =
noremap <silent> ,ml L
noremap <silent> ,mj J
noremap <silent> ,mk K
noremap <silent> ,mh H
noremap <silent> ,mr R
noremap <silent> ,vwd 18<
noremap <silent> ,vwi 18>
noremap <silent> ,wd 10-
noremap <silent> ,wi 10+
map <silent> ,p2v :r!cat /tmp/pwd2vim.tmp
map <silent> ,pwd :pwd
map <silent> ,s2t :%s/	/    /g
map <silent> ,d2s mz:%s/��/, /ge:%s/��/. /ge:%s/��/; /ge:%s/��/: /ge:%s/��/  /ge:%s/��/"/ge:%s/��/"/ge:%s/��/?/ge:%s/��/!/ge:%s/��/./ge:%s/��/)/ge:%s/��/(/ge:%s/��/.../ge:%s/��/=/ge:%s/��/\//ge:%s/��/\*/ge:%s/��/-/ge:%s/��/#/ge:%s/��/:/ge:%s/��/-/ge`z
map <silent> ,sq qz"apjjf"mzggjlv$hy`zpjqi
nmap ,cw :cw 10 :cn
nmap ,cp :cp
nmap ,cn :cn
map <silent> ,s [c
map <silent> ,w ]c
map <silent> ,nsc :set noscrollbind
map <silent> ,sc :set scrollbind
map <silent> ,bsw :TxtBrowserSearch
map <silent> ,bfw :TxtBrowserWord
map <silent> ,bgu :TxtBrowserUrl
map <silent> ,bft :set ft=txt
map <silent> ,jlc :cs show
map <silent> ,jlt :set tags
map <silent> ,cah :CalendarH
map <silent> ,stc :call ToggleSketch()
map <silent> ,cis :source $VIM/vimfiles/syntax/txt.vim
map <silent> ,ccs :.,.s/ //g
map <silent> ,cca ,cak
map <silent> ,ccc ,cck
nmap <silent> ,tto :NERDTreeToggle
nmap <silent> ,P <Plug>ToggleProject
nmap <silent> ,pr :Project Project zR
nmap <silent> ,ezo :exe "Cfoldvar " . line(".")
map <silent> ,   q:
map <silent> ,eex :C target exec
map <silent> ,efi :C file
map <silent> ,ede :C delete
map <silent> ,eru :exe "C run"
map <silent> ,efn :exe "C finish"
map <silent> ,eib :exe "C info breakpoints"
map <silent> ,efl :C file Example.exe 
map <silent> ,exl :C target exec Example.exe
nmap <silent> ,ihv :IHV
nmap <silent> ,ihs :IHS
nmap <silent> ,ihh :IH
nmap <silent> ,dox :Doxmzkddk2lvf/r=xf Dr*0%hmxl%lr*hj`xjr `xjllvf/hr=f Dhr*`za:	
nmap <silent> ,wm :WMToggle
nmap <silent> ,bot :BottomExplorerWindow
nmap <silent> ,fir :FirstExplorerWindow
map <silent> ,mb :MiniBufExplorer
map <silent> ,hb :HSBufExplorer
map <silent> ,tf :call TlistToggle_close_diCtTmp("__Tag_List__", 1)jh
map <silent> ,tl :call TlistToggle_close_diCtTmp("diCtTmp", 0)
map <silent> ,cre :cs reset
noremap <silent> ,dva 15+
map <silent> ,viw :call SwitchToBuf("F:/notes/blog/z_other/01OneThousandWrods.txt")
map <silent> ,vig :call SwitchToBuf("F:/notes/blog/vim/regular-expression/regular_expressions_test.txt")
map <silent> ,vif :call SwitchToBuf("C:/Vim/Vim/_vimperatorrc")
map <silent> ,vie :call SwitchToBuf("F:/notes/blog/english/e-new-words.txt")
map <silent> ,vik :call SwitchToBuf("F:/notes/blog/vim/script/vim_script_settings_of_me.txt")
map <silent> ,vib :call SwitchToBuf("F:/notes/blog/book/01.txt")
map <silent> ,vio :call SwitchToBuf("F:/notes/blog/vim/13vim_skill.txt")
map <silent> ,vim :call SwitchToBuf("C:/Vim/Vim/_vimrc")
map <silent> ,vis :source ~\_vimrc
map Q gq
nmap gx <Plug>NetrwBrowseX
map <silent> mm <Plug>Vm_toggle_sign 
vnoremap p :let current_reg = @"gvs=current_reg
onoremap <C-F4> c
onoremap <C-Tab> w
vmap <S-Insert> 
nnoremap <C-F4> c
vnoremap <C-F4> c
nnoremap <C-Tab> w
vnoremap <C-Tab> w
nmap <S-Insert> "+gP
omap <S-Insert> "+gP
map <S-F2> <Plug>Vm_goto_prev_sign
map <F2> <Plug>Vm_goto_next_sign
map <C-F2> <Plug>Vm_toggle_sign
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nmap <Nul><Nul>d :vert scs find d =expand("<cword>")
nmap <Nul><Nul>i :vert scs find i ^=expand("<cfile>")$	
nmap <Nul><Nul>f :vert scs find f =expand("<cfile>")	
nmap <Nul><Nul>e :vert scs find e =expand("<cword>")
nmap <Nul><Nul>t :vert scs find t =expand("<cword>")
nmap <Nul><Nul>c :vert scs find c =expand("<cword>")
nmap <Nul><Nul>g :vert scs find g =expand("<cword>")
nmap <Nul><Nul>s :vert scs find s =expand("<cword>")
nmap <Nul>d :scs find d =expand("<cword>")	
nmap <Nul>i :scs find i ^=expand("<cfile>")$	
nmap <Nul>f :scs find f =expand("<cfile>")	
nmap <Nul>e :scs find e =expand("<cword>")	
nmap <Nul>t :scs find t =expand("<cword>")	
nmap <Nul>c :scs find c =expand("<cword>")	
nmap <Nul>g :scs find g =expand("<cword>")	
nmap <Nul>s :scs find s =expand("<cword>")	
map <S-F8> :NextInBlock
map <S-F9> :PrevInBlock
nmap <silent> <Plug>CalendarH :cal Calendar(1)
nmap <silent> <Plug>CalendarV :cal Calendar(0)
nmap <silent> <Plug>NERDCommenterAppend :call NERDComment(0, "append")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment(0, "toEOL")
vnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(1, "uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment(0, "uncomment")
vnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(1, "nested")
nnoremap <silent> <Plug>NERDCommenterNest :call NERDComment(0, "nested")
vnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(1, "alignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment(0, "alignBoth")
vnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(1, "alignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment(0, "alignLeft")
vmap <silent> <Plug>NERDCommenterYank :call NERDComment(1, "yank")
nmap <silent> <Plug>NERDCommenterYank :call NERDComment(0, "yank")
vnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(1, "invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment(0, "invert")
vnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(1, "sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment(0, "sexy")
vnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(1, "minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment(0, "minimal")
vnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(1, "toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment(0, "toggle")
vnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(1, "norm")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment(0, "norm")
noremap <M-C-X> 
noremap <M-C-A> 
noremap <M-Space> :simalt ~
map <F6> :tabnext
map <F5> :tabprevious
map <F4> :tabnew
map <F3> :tabclose
map <F10> :exe "C p " expand("<cWORD>") 
map <F9> :exe "C p " expand("<cword>") 
map <F8> :exe "Cclear " expand("%") ":" . line(".")
vmap <C-Del> "*d
vnoremap <S-Del> "+x
vnoremap <C-Insert> "+y
inoremap  gggHG
inoremap  :update
inoremap  u
cmap  +
inoremap <expr>  omni#cpp#maycomplete#Complete()
imap ,ihn :IHN
imap ,is :IHS:A
imap ,ih :IHS
imap <silent> ,ccc /*a
inoremap <expr> . omni#cpp#maycomplete#Dot()
inoremap <expr> : omni#cpp#maycomplete#Scope()
inoremap <expr> > omni#cpp#maycomplete#Arrow()
iabbr ch child
iabbr pa parent
iabbr fo follow-fork-mode
abbr teh the
iabbr fil C:\Program Files\Vim\vimfiles
iabbr vimm C:\Program Files\Vim\vim72
iabbr doc $HOME/.vim/doc
iabbr plu $HOME/.vim/plugin
iabbr /u /usr/local/share/vim/vim72/
iabbr "e """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbr "b """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbr //e  *************************************************************************/
iabbr //b /*************************************************************************
iabbr pro $(PROGS)
iabbr pr PROGS =
iabbr PR PROGS =
iabbr inc include
iabbr li $(LINK.c)
iabbr LI $(LINK.c)
iabbr co $(COMPILE.c)
iabbr CO $(COMPILE.c)
iabbr ldl $(LDLIBS)
iabbr LDL $(LDLIBS)
iabbr ldd $(LDDIR)
iabbr LDD $(LDDIR)
iabbr crv createvar
iabbr ad advertisement
let &cpo=s:cpo_save
unlet s:cpo_save
set ambiwidth=double
set autochdir
set autoindent
set backspace=indent,eol,start
set balloonexpr=BalloonDeclaration()
set browsedir=buffer
set cindent
set completeopt=longest,menuone
set cscopetag
set cscopetagorder=1
set cscopeverbose
set noequalalways
set fileencodings=utf-8,chinese
set guioptions=egt
set helplang=Ch
set hlsearch
set incsearch
set linespace=2
set matchtime=7
set nomodeline
set omnifunc=omni#cpp#complete#Main
set ruler
set scrolloff=2
set shiftwidth=4
set showmatch
set smartindent
set softtabstop=4
set statusline=%f%m%r,%Y,%{&fileformat}\ \ \ ASCII=%b,HEX=%B\ \ \ %l,%c%V\ %p%%\ \ \ [%L\ lines]
set tabstop=2
set tags=./tags,tags,./tags,./../tags,./../../tags,./../../../tags,./**/tags,tags,E:\\lang\\cpp\\cpp\\cpp_src\\tags,E:\\lang\\win32\\mfc\\tags,E:\\lang\\win32\\winapi\\tags,C:\\project\\orge\\OgreSDK\\orge_main_src\\tags,E:\\liaocaiyuan\\destop\\ogre\\ogre2\\include\\orz\\tags,C:\\project\\orge\\OgreSDK\\include\\tags
set title
set updatetime=500
set nowarn
set whichwrap=b,s,<,>,[,]
set window=45
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd E:\lang\sap\0abap\all\src
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +9 new\note.txt
badd +8 z_j_6_6.abap
badd +19 z_j_8_1.abap
badd +20 z_j_8_2.abap
badd +1 new\z_j_9_1.abap
badd +2 z_j_6_4_3_scren.abap
badd +6 new\z_j_9_1_s.abap
badd +1 z_j_6_4_3_o.abap
badd +9 z_j_6_4_3.abap
badd +1 z_j_9_1.abap
badd +11 z_j_9_1_s.abap
badd +5 message.txt
badd +1 ~\_vimrc
badd +1 C:\Users\liaocaiyuan\AppData\Local\Temp\z_j_9_2.abap
badd +106 z_j_6_5_3.abap
badd +0 z_j_6_5.abap
badd +30 z_j_6_5_3_scren.abap
silent! argdel *
edit z_j_9_1_s.abap
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 3 + 23) / 46)
exe 'vert 1resize ' . ((&columns * 89 + 89) / 179)
exe '2resize ' . ((&lines * 6 + 23) / 46)
exe 'vert 2resize ' . ((&columns * 89 + 89) / 179)
exe '3resize ' . ((&lines * 33 + 23) / 46)
exe 'vert 3resize ' . ((&columns * 89 + 89) / 179)
exe '4resize ' . ((&lines * 22 + 23) / 46)
exe 'vert 4resize ' . ((&columns * 89 + 89) / 179)
exe '5resize ' . ((&lines * 21 + 23) / 46)
exe 'vert 5resize ' . ((&columns * 89 + 89) / 179)
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'abap'
setlocal filetype=abap
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=-,48-57,_,A-Z,a-z
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=omni#cpp#complete#Main
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'abap'
setlocal syntax=abap
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 11 - ((2 * winheight(0) + 1) / 3)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
11
normal! 0
wincmd w
argglobal
edit C:\Users\liaocaiyuan\AppData\Local\Temp\z_j_9_2.abap
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'abap'
setlocal filetype=abap
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=-,48-57,_,A-Z,a-z
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=omni#cpp#complete#Main
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'abap'
setlocal syntax=abap
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 3) / 6)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
edit z_j_9_1.abap
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'abap'
setlocal filetype=abap
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=-,48-57,_,A-Z,a-z
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=omni#cpp#complete#Main
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'abap'
setlocal syntax=abap
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
argglobal
edit z_j_8_1.abap
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'abap'
setlocal filetype=abap
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=-,48-57,_,A-Z,a-z
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=omni#cpp#complete#Main
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'abap'
setlocal syntax=abap
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 19 - ((18 * winheight(0) + 11) / 22)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 015l
wincmd w
argglobal
edit z_j_6_6.abap
inoremap <buffer> 	 =CodeComplete()=SwitchRegion()
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'abap'
setlocal filetype=abap
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=-,48-57,_,A-Z,a-z
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=omni#cpp#complete#Main
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=4
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'abap'
setlocal syntax=abap
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 8 - ((7 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 0
wincmd w
3wincmd w
exe '1resize ' . ((&lines * 3 + 23) / 46)
exe 'vert 1resize ' . ((&columns * 89 + 89) / 179)
exe '2resize ' . ((&lines * 6 + 23) / 46)
exe 'vert 2resize ' . ((&columns * 89 + 89) / 179)
exe '3resize ' . ((&lines * 33 + 23) / 46)
exe 'vert 3resize ' . ((&columns * 89 + 89) / 179)
exe '4resize ' . ((&lines * 22 + 23) / 46)
exe 'vert 4resize ' . ((&columns * 89 + 89) / 179)
exe '5resize ' . ((&lines * 21 + 23) / 46)
exe 'vert 5resize ' . ((&columns * 89 + 89) / 179)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . s:sx
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
