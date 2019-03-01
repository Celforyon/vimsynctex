"""""""""""""""" Functions """"""""""""""""""""""""""""

function! vimsynctex#view()
	let l:viewer = vimsynctex#viewer#get()
	let l:opts = vimsynctex#viewer#opts()
	let l:pdf = vimsynctex#pdf#get()

	let l:cmd = l:viewer.' '.l:opts.' '.l:pdf

	call vimsynctex#util#bgexec(l:cmd)
endfunction

function! vimsynctex#forward()
	let l:viewer = vimsynctex#viewer#get()
	let l:opts = vimsynctex#viewer#opts()
	let l:pdf = vimsynctex#pdf#get()

	let l:file = expand('%:p')
	let l:line = line('.')
	let l:column = col('.')
	let l:opt_forward = vimsynctex#viewer#forwardopt(l:file, l:line, l:column)

	let l:cmd = l:viewer.' '.l:opts.' '.l:opt_forward.' '.l:pdf

	call vimsynctex#util#bgexec(l:cmd)
endfunction

function! vimsynctex#backwards(f, l, c)
	let l:f = vimsynctex#fs#realsource(a:f)
	execute 'edit '.l:f
	call cursor(a:l, max([a:c, 1]))
	redraw!
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
