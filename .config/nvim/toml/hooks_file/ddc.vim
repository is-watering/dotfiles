" hook_source {{{

call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('sources', ['around', 'skkeleton', 'deoppet', 'file'])

call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_head'],
    \   'sorters': ['sorter_rank'],
    \   'converters': ['converter_remove_overlap']
    \ },
    \ 'around': {
    \   'mark': 'A'
    \ },
    \ 'skkeleton': {
    \   'mark': 'skkeleton',
    \   'matchers': ['skkeleton'],
    \   'sorters': []
    \   },
    \ 'deoppet': {
    \   'mark': 'dp',
    \   'dup': v:true,
    \   },
    \ 'file': {
    \   'mark': 'F',
    \   'isVolatile': v:true,
    \   'forceCompletionPattern': '\S/\S*',
    \ }})

call ddc#custom#patch_global('sourceParams', {
    \ 'around': {'maxSize': 500},
    \ })

call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
    \ 'clangd': {'mark': 'C'},
    \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
    \ 'around': {'maxSize': 100},
    \ })
call ddc#custom#patch_filetype(
    \ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
    \ 'sourceOptions': {
    \   'file': {
    \     'forceCompletionPattern': '\S\\\S*',
    \   },
    \ },
    \ 'sourceParams': {
    \   'file': {
    \     'mode': 'win32',
    \   },
    \ }})

" Mappings
inoremap <silent><expr> <TAB>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#select_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#select_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

" call ddc#custom#patch_global(#{
" \   ui: 'pum',
" \   autoCompleteEvents: [
" \     'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged',
" \   ],
" \   cmdlineSources: {
" \     ':': ['cmdline', 'cmdline-history', 'around'],
" \   },
" \ })
" nnoremap :       <Cmd>call CommandlinePre()<CR>:

" function CommandlinePre() abort
"   cnoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
"   cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
"   cnoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
"   cnoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
"   cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
"   cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

"   autocmd User DDCCmdlineLeave ++once call CommandlinePost()

"   " Enable command line completion for next command line session
"   call ddc#enable_cmdline_completion()
" endfunction
" function CommandlinePost() abort
"   silent! cunmap <Tab>
"   silent! cunmap <S-Tab>
"   silent! cunmap <C-n>
"   silent! cunmap <C-p>
"   silent! cunmap <C-y>
"   silent! cunmap <C-e>
" endfunction

call ddc#enable()

" }}}
