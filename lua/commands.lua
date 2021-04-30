local com = vim.api.nvim_command

com([[command! -nargs=0 BO silent! execute "%bd|e#|bd#"]])
com([[command BD bp | bd #]])
com([[command! -nargs=0 WS %s/\s\+$// | normal! ``]])
com([[command! -nargs=0 WT %s/[^\t]\zs\t\+/ / | normal! ``]])
com([[command! -bar HL echo synIDattr(synID(line('.'),col('.'),0),'name')]] ..
        [[synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')]])
com([[command! WW w !sudo tee % > /dev/null]])
com(
    [[command! -bang -nargs=* -complete=file Make call asyncdo#run(1, &makeprg, <f-args>)]])
com(
    [[command! -bang -nargs=* -complete=file LMake call asyncdo#lrun(1, &makeprg, <f-args>)]])
com([[command! -bang -nargs=+ -complete=file ]] ..
        [[Grep call asyncdo#run(1, {'job': &grepprg, 'errorformat': &grepformat}, <f-args>) ]] ..
        [[| let @/=split("<args>")[0] | call feedkeys(":let &hlsearch=1\<CR>", "n")]])
