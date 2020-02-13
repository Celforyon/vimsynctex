"""""""""""""""" Functions """"""""""""""""""""""""""""

function! vimsynctex#fs#checkgitdir(dir)
	let l:dir = system('cd '.a:dir.'; git 2>/dev/null rev-parse --show-toplevel')
	if v:shell_error
		return ''
	endif
	return substitute(l:dir, '\n', '', 'g')
endfunction

function! vimsynctex#fs#root()
	let l:dir = fnamemodify(expand('%:p'), ':h')
	return vimsynctex#fs#checkgitdir(l:dir)
endfunction()

function! vimsynctex#fs#realsource(f)
	let l:f = a:f

	if exists('b:vimsynctex_root') && b:vimsynctex_root != ''
		let l:f = substitute(l:f, '[^.]*\./', b:vimsynctex_root.'/', '')
	endif

	return l:f
endfunction

function! vimsynctex#fs#synctex()
	let l:root = vimsynctex#fs#root()
	if l:root == ''
		return ''
	endif

	let l:list = split(globpath(l:root, 'build/**/*.synctex.gz'), '\n')

	if len(l:list) == 0
		return ''
	endif

	return fnamemodify(l:list[-1], ':p')
endfunction

function! vimsynctex#fs#pdf()
	let l:synctex = vimsynctex#fs#synctex()
	if l:synctex == ''
		return ''
	endif

	let l:pdf = substitute(l:synctex, '\.synctex\.gz$', '.pdf', '')
	if !filereadable(l:pdf)
		return ''
	endif

	return l:pdf
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
