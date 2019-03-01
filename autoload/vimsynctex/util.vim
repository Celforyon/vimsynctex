"""""""""""""""" Functions """"""""""""""""""""""""""""

function! vimsynctex#util#bgexec(cmdline)
	call system(a:cmdline.'&')
endfunction

function! vimsynctex#util#exceptwrapper(f)
	try
		call call(function(a:f), [])
	catch /vimsynctex*/
	endtry
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
