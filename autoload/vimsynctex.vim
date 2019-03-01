"""""""""""""""" Functions """"""""""""""""""""""""""""

function! vimsynctex#view()
	let l:pdf = g:vimsynctex_pdf
	let l:cmd = g:vimsynctex_viewer.' '.l:pdf.'&'
	silent execute '!'.l:cmd
	redraw!
endfunction

function! vimsynctex#forward()
	let l:file = expand('%:p')
	let l:line = line('.')
	let l:column = col('.')
	let l:pdf = g:vimsynctex_pdf

	let l:cmd = g:vimsynctex_viewer.' --synctex-forward '.l:line.':'.l:column.':'.l:file.' '.l:pdf.'&'

	echom 'execute: '.l:cmd
	silent execute '!'.l:cmd
	redraw!
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
