"---------------------------------------------------------------------------
" Commands

command! -nargs=* Autocmd   autocmd myVimrc <args>
command! -nargs=* AutocmdFT autocmd myVimrc FileType <args>

command! -nargs=1 Indent
  \ execute 'setlocal tabstop='.<q-args> 'softtabstop='.<q-args> 'shiftwidth='.<q-args>

command! -nargs=0 -bar GoldenRatio execute 'vertical resize' &columns * 5 / 8

" Shows the syntax stack under the cursor
command! -bar SS echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

" Mkdir
command! -nargs=1 -bang MakeDir call vimrc#makeDir(<f-args>, "<bang>")
Autocmd BufWritePre,FileWritePre *? call vimrc#makeDir('<afile>:h', v:cmdbang)

" TrimWhiteSpace
command! -nargs=* -complete=file TrimWhiteSpace f <args> | call vimrc#trimWhiteSpace()
Autocmd BufWritePre,FileWritePre *? call vimrc#trimWhiteSpace()
nnoremap <silent> ,<Space> :<C-u>TrimWhiteSpace<CR>