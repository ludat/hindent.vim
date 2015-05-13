function! hindent#toggle ()
    if !empty(w:indent_match_list)
        call hindent#enable()
    else
        call hindent#disable()
    endif
endfunction

function! hindent#enable ()
    " add background for indents
    call add(w:indent_match_list, matchadd("indentL", '^\(	\| \{' . &tabstop . '\}\)\+'))
    " add background for even highlights
    call add(w:indent_match_list, matchadd("indentR", '\(	\| \{' . &tabstop . '\}\)\zs\1'))
    " ignore first two levels of indentation
    if g:hindent_ignore_first > 0
        call add(w:indent_match_list, matchadd("Ignore", '^\(	\| \{' . &tabstop . '\}\)\{1,' . w:hindent_ignore_first . '\}'))
    endif
endfunction

function! hindent#disable ()
    for i_match in w:indent_match_list
        let l:index = index(w:indent_match_list, i_match)
        if l:index != -1
            call matchdelete(i_match)
            call remove(w:indent_match_list, l:index)
        endif
    endfor
endfunction
