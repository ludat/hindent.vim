if exists("g:loaded_Hindent") || &compatible
    finish
endif
let g:loaded_hindent = 1
let w:indent_match_list = []

if !exists('g:hindent_ignore_first')
    let g:hindent_ignore_first = 0
else
    if type(g:hindent_ignore_first) != type(0)
        echom "Hindent: hindent_ignore_first must be a number"
        echom "Hindent: setting hindent_ignore_first to 0"
        let g:hindent_ignore_first = 0
    endif
endif

if exists("g:hindent_autoload")
    if g:hindent_autoload
        augroup Hindent_indents
            autocmd!
            autocmd VimEnter * call hindent#enable()
        augroup END
    endif
endif

noremap <script> <Plug>HindentToggle :call hindent#toggle()
noremap <script> <Plug>HindentEnable :call hindent#enable()
noremap <script> <Plug>HindentDisable :call hindent#disable()

command! HindentEnable :call hindent#enable()
command! HindentToggle :call hindent#toggle()
command! HindentReload :call hindent#toggle()
command! HindentDisable :call hindent#disable()
