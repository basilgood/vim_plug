# vim_plug
vim configuration with vim-plug

```vim
git clone git@github.com:basilgood/vim_plug.git ~/.vim
open vim and :PlugInstall
leader is original \
open nerdtree with -
Tab switch windows
save with Ctrl-s in normal and insert mode
Ctrl-z in insert mode with every sequence
toggle numbers ,n
<Esc><Esc> in normal mode nohlsearch
close window (buffer delete) q or Ctrl-q
statusline show mixed indentations(spaces + tabs)
statusline show if we have trailling spaces
reload window with ,,
<leader>f open ranger in current window,
and open chosen file in vim.
ranger: zh show hidden and the rest of the
commands are like vim keys. Ex: yy copy file, dd delete, / search etc.
asyncrun:
  do whatever command, like in shell but in vim command line.
  Ex: AsyncRun git status, run command async,
and show output in quickfix window. F9 or q or Ctrl-q close that window.
F9 toggle quickfix window.
in normal mode <BS> show buffers in wildmenu and
with tab or arrows(left, right) switch to the desired buffer.

<F5> show git status in quickfix window
with q or Ctrl-q or <F9> close quickfix window
<F6> git add .(hit enter if want to add all or edit)
<F7> git commit -m '' (put the message between quotes and hit enter)
<F8> git push (hit enter or edit)
```
