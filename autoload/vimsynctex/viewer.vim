"""""""""""""""" Variables """"""""""""""""""""""""""""

let s:scriptsdir = fnamemodify(resolve(expand("<sfile>:p")), ':h:h:h').'/scripts/'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Functions """"""""""""""""""""""""""""

function! vimsynctex#viewer#opencmds(pdf)
	let l:name = fnamemodify(g:vimsynctex_viewer, ':t')
	let l:cmds = []
	if l:name == 'zathura'
		let l:opts = ''
		if exists('v:servername') && v:servername != ''
			let l:opts = " -x '".s:scriptsdir.'vimremote'.' "'.v:servername.'" "%{input}" %{line} %{column}'."'"
		endif
		let l:cmds += [g:vimsynctex_viewer.' '.l:opts.' '.a:pdf]
	elseif l:name == 'evince'
		let l:cmds += [g:vimsynctex_viewer.' '.a:pdf]
		let l:cmds += [s:scriptsdir.'evince_backward_search '."'".a:pdf."' '".s:scriptsdir.'vimremote'.' "'.v:servername.'" "%f" %l 1'."'"]
	else
		echohl WarningMsg|echom '[VimSynctex] unsupported viewer: '.l:name|echohl None
		throw 'vimsynctex#viewer#get'
	endif

	return l:cmds
endfunction

function! vimsynctex#viewer#forwardcmds(pdf, file, line, column)
	let l:name = fnamemodify(g:vimsynctex_viewer, ':t')
	let l:cmds = []
	if l:name == 'zathura'
		let l:opts = ''
		if exists('v:servername') && v:servername != ''
			let l:opts = " -x '".s:scriptsdir.'vimremote'.' "'.v:servername.'" "%{input}" %{line} %{column}'."' "
		endif
		let l:opts .= '--synctex-forward '."'".a:line.':'.a:column.':'.a:file."'"
		let l:cmds += [g:vimsynctex_viewer.' '.l:opts.' '.a:pdf]
	elseif l:name == 'evince'
		let l:cmds += [s:scriptsdir.'evince_forward_search '."'".a:pdf."' ".a:line." '".a:file."'"]
	else
		echohl WarningMsg|echom '[VimSynctex] unsupported viewer: '.l:name|echohl None
		throw 'vimsynctex#viewer#get'
	endif

	return l:cmds
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
