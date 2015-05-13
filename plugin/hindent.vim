if exists("g:loaded_Hindent") || &compatible
    echom "NOPE"
    finish
endif
let g:loaded_hindent = 1
let w:indent_match_list = []

if !exists('g:hindent_ignore_first')
    let g:hindent_ignore_first = 0
endif

if exists("g:hindent_autoload")
    augroup Hindent_indents
        autocmd!
        autocmd VimEnter * call hindent#enable()
    augroup END
endif

noremap <unique><script> <Plug>HindentToggle :call hindent#toggle()
noremap <unique><script> <Plug>HindentEnable :call hindent#enable()
noremap <unique><script> <Plug>HindentDisable :call hindent#disable()

command HindentEnable :call hindent#enable()
command HindentToggle :call hindent#toggle()
command HindentDisable :call hindent#disable()
