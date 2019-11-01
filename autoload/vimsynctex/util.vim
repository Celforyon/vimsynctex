"""""""""""""""" Functions """"""""""""""""""""""""""""

function! vimsynctex#util#bgexec(cmdline)
	return system(a:cmdline.'>/dev/null 2>/dev/null & echo -n $!')
endfunction

function! vimsynctex#util#exceptwrapper(f)
	try
		call call(function(a:f), [])
	catch /vimsynctex*/
	endtry
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
