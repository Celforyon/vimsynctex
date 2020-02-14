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
	let l:plist = []

	for elem in l:list
		let l:plist += [fnamemodify(elem, 'p')]
	endfor

	return l:plist
endfunction

function! vimsynctex#fs#pdf(excludelist)
	let l:synctex = vimsynctex#fs#synctex()
	if l:synctex == []
		return ''
	endif

	let l:pdfs = []
	let l:apdfs = []

	for stx in l:synctex
		let l:pdf = substitute(stx, '\.synctex\.gz$', '.pdf', '')
		if filereadable(l:pdf)
			let l:apdfs += [l:pdf]
			if count(a:excludelist, l:pdf) == 0
				let l:pdfs += [l:pdf]
			endif
		endif
	endfor

	if l:pdfs == []
		if l:apdfs == []
			return ''
		else
			return l:apdfs[0]
		endif
	endif

	return l:pdfs[0]
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
