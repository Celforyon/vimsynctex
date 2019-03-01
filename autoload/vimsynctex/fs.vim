"""""""""""""""" Functions """"""""""""""""""""""""""""

function! vimsynctex#fs#checkgitdir(dir)
	call system('cd '.a:dir.'; git>/dev/null 2>&1 rev-parse --show-toplevel')
	return !v:shell_error
endfunction

function! vimsynctex#fs#root(file)
	let l:dir = fnamemodify(a:file, ':h')

	if vimsynctex#fs#checkgitdir(l:dir)
		return system('cd '.l:dir.'; git 2>/dev/null rev-parse --show-toplevel|tr -d "\n"')
	endif

	return ''
endfunction()
function! vimsynctex#fs#realsource(f)
	let l:f = a:f

	if exists('b:vimsynctex_root') && b:vimsynctex_root != ''
		let l:f = substitute(l:f, '[^.]*\./', b:vimsynctex_root.'/', '')
	endif

	return l:f
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
