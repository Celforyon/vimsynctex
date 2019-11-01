"""""""""""""""" Variables """"""""""""""""""""""""""""

let s:vimsynctex_viewer_pid = 0
let s:vimsynctex_pids = []

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
	if l:cmds == []
		return
	endif

	call vimsynctex#cleanup()

	let s:vimsynctex_viewer_pid = vimsynctex#util#bgexec(cmds[0])
	for cmd in l:cmds[1:]
		let s:vimsynctex_pids += [vimsynctex#util#bgexec(cmd)]
	endfor
endfunction

function! vimsynctex#forward()
	if !vimsynctex#viewer#running(s:vimsynctex_viewer_pid)
		call vimsynctex#view()
	endif

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

function! vimsynctex#cleanup()
	for l:pid in s:vimsynctex_pids
		call system("kill ".l:pid)
	endfor
	let s:vimsynctex_pids = []
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Autocmd """"""""""""""""""""""""""""""

augroup vimsynctex
	autocmd VimLeavePre * call vimsynctex#cleanup()
augroup end

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
