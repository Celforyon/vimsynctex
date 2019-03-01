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
	let l:opt_forward = '--synctex-forward '."'".l:line.':'.l:column.':'.l:file."'"

	let l:cmd = l:viewer.' '.l:opts.' '.l:opt_forward.' '.l:pdf

	call vimsynctex#util#bgexec(l:cmd)
endfunction

function! vimsynctex#backwards(f, l, c)
	execute 'edit '.a:f
	call cursor(a:l, max([a:c, 1]))
	redraw!
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
