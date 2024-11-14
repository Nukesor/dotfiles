"----- Plugin Config ------
 nnoremap <C-p> :Files<Cr>

 " Use proximity-sort to make sure that files are properly sorted
 function! s:list_cmd()
     let base = fnamemodify(expand('%'), ':h:.:S')
     return base == '.' ? 'fd -t f' : printf('fd -t f | proximity-sort %s', expand('%'))
 endfunction

 command! -bang -nargs=? -complete=dir Files
     \ call fzf#vim#files(
     \   <q-args>,
     \   fzf#vim#with_preview({
     \      'source': s:list_cmd(),
     \      'options': '--tiebreak=index --bind=ctrl-n:preview-down,ctrl-p:preview-up'
     \   }),
     \   <bang>0
     \ )
