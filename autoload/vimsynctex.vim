"""""""""""""""" Functions """"""""""""""""""""""""""""

function! vimsynctex#setpdf()
	let l:vimsynctex_pdf = vimsynctex#fs#pdf()
	if l:vimsynctex_pdf != ''
		let b:vimsynctex_pdf = l:vimsynctex_pdf
	endif
endfunction

function! vimsynctex#update()
	call vimsynctex#setpdf()
endfunction

function! vimsynctex#view()
	let l:pdf = vimsynctex#pdf#get()
	let l:cmds = vimsynctex#viewer#opencmds(l:pdf)
	for cmd in l:cmds
		call vimsynctex#util#bgexec(cmd)
	endfor
endfunction

function! vimsynctex#forward()
	let l:pdf = vimsynctex#pdf#get()
	let l:file = expand('%:p')
	let l:line = line('.')
	let l:column = col('.')

	let l:cmds = vimsynctex#viewer#forwardcmds(l:pdf, l:file, l:line, l:column)

	for cmd in l:cmds
		call vimsynctex#util#bgexec(cmd)
	endfor
endfunction

function! vimsynctex#backwards(f, l, c)
	let l:f = vimsynctex#fs#realsource(a:f)
	execute 'edit '.l:f
	call cursor(a:l, max([a:c, 1]))
	redraw!
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
