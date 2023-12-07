let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Projects/caddie/airbnb-clone
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +188 app/components/modals/RegisterModal.tsx
badd +132 app/components/modals/LoginModal.tsx
badd +1 node_modules/@material-tailwind/react/types/components/navbar.js
badd +1 node_modules/@material-tailwind/react/components/Navbar/index.js
badd +30 app/components/navbar/Navbar.tsx
badd +27 app/trips/page.tsx
badd +54 app/trips/TripsClient.tsx
badd +41 app/onboarding/page.tsx
badd +12 app/components/MaterialUI.tsx
badd +1 node_modules/tar/lib/normalize-windows-path.js
badd +15 tailwind.config.js
argglobal
%argdel
edit tailwind.config.js
argglobal
balt node_modules/tar/lib/normalize-windows-path.js
let s:l = 4 - ((3 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 025|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
