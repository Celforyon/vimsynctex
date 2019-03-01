"""""""""""""""" Functions """"""""""""""""""""""""""""

function! vimsynctex#pdf#get()
	let l:pdf = ''
	if exists('b:vimsynctex_pdf')
		let l:pdf = b:vimsynctex_pdf
	elseif exists('g:vimsynctex_pdf')
		let l:pdf = g:vimsynctex_pdf
	else
		echohl WarningMsg|echom '[VimSynctex] you must set (b|g):vimsynctex_pdf'|echohl None
		throw 'vimsynctex#pdf#get'
	endif

	return l:pdf
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
