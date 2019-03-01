"""""""""""""""" Variables """"""""""""""""""""""""""""

let s:scriptsdir = fnamemodify(resolve(expand("<sfile>:p")), ':h:h:h').'/scripts/'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Functions """"""""""""""""""""""""""""

function! vimsynctex#viewer#get()
	let l:name = fnamemodify(g:vimsynctex_viewer, ':t')
	if l:name == 'zathura'
		return g:vimsynctex_viewer
	else
		echohl WarningMsg|echom '[VimSynctex] unsupported viewer: '.l:name|echohl None
		throw 'vimsynctex#viewer#get'
	endif
endfunction

function! vimsynctex#viewer#opts()
	let l:name = fnamemodify(g:vimsynctex_viewer, ':t')
	let l:opts = ''

	if l:name == 'zathura'
		if exists('v:servername') && v:servername != ''
			let l:opts = l:opts." -x '".s:scriptsdir.'vimremote'." \"".v:servername."\" \"%{input}\" %{line} %{column}'"
		endif
	endif

	return l:opts
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
