" Location:   plugin/retrunner.vim
" Maintainer: Mikkel Malmberg <http://mikker.sexy/>
" Version:    0.1

if exists("g:loaded_rerunner") || &cb
  finish
endif
let g:loaded_rerunner = 1

fun! s:run(args)
  let l:focus = expand(a:args)
  if l:focus != ""
    let g:rerunner_focus=l:focus
  else
    if !exists("g:rerunner_focus")
      echo "No focus set yet"
    else
      execute g:rerunner_focus
    endif
  endif
endfun

fun! s:what()
  if !exists("g:rerunner_focus")
    echo "No focus set yet"
  else
    echo g:rerunner_focus
  end
endfun

command! -nargs=* -complete=command Rerun call s:run(<q-args>)
command! -nargs=0 RerunWhat call s:what()

augroup mapCREx
  au!
  " Leave the return key alone when i
  " command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :nunmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
  " Also bring back normal <cr> in QuickFix wins
  autocmd! FileType qf nnoremap <buffer> <cr> <cr>
augroup END

fun! MapCR()
  nnoremap <cr> :Rerun<cr>
endfun
call MapCR()

