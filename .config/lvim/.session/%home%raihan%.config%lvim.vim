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
badd +97 ~/.config/lvim/lua/user/plugins.lua
badd +9 ~/.config/lvim/config.lua
badd +26 ~/.config/lvim/lua/user/options.lua
badd +12 ~/.config/lvim/lua/user/keymaps.lua
badd +11 ~/Projects/caddie/airbnb-clone/app/actions/getListingById.ts
badd +9 app/page.tsx
badd +24 app/components/listings/ListingCard.tsx
badd +13 app/api/auth/\[...nextauth]/options.ts
argglobal
%argdel
edit app/api/auth/\[...nextauth]/options.ts
argglobal
balt app/components/listings/ListingCard.tsx
let s:l = 13 - ((12 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 0
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
