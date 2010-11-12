" Name: AutoSetIndentStyle
" Version: 0.1
" Author: tanabe
" NOTE: this is experimental script
function! AutoSetIndentStyle()
  let l:max_lines = 100
  let l:total_lines = line("$")
  let l:tab_indented_lines = 0
  let l:space_indented_lines = 0
  let l:index = 0
  if (l:total_lines < l:max_lines)
    let l:max_lines = l:total_lines
  endif

  while l:index <= l:max_lines
    let l:line = getline(l:index)
    if match(line, "^\t\\+") == 0
      let l:tab_indented_lines = l:tab_indented_lines + 1
    elseif match(line, "^ \\+") == 0
      let l:space_indented_lines = l:space_indented_lines + 1
    endif
    let l:index = l:index + 1
  endwhile

  if (l:tab_indented_lines < l:space_indented_lines)
    setlocal expandtab
  elseif (l:tab_indented_lines > l:space_indented_lines)
    setlocal noexpandtab
  endif

endfunction
