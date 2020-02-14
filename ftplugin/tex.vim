" vimsynctex
" Maintainer: Alexis Pereda
" Version: 1

"""""""""""""""" Variables """"""""""""""""""""""""""""

if !exists('g:vimsynctex_viewer')
	let g:vimsynctex_viewer = 'zathura'
endif

if !exists('b:vimsynctex_root')
	let b:vimsynctex_root = vimsynctex#fs#root()
endif

if !exists('b:vimsynctex_pdf')
	call vimsynctex#setpdf([])
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Functions """"""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Commands """""""""""""""""""""""""""""

command! -bang SynctexUpdate :call vimsynctex#util#exceptwrapper('vimsynctex#update', <bang>0)

command! SynctexView :call vimsynctex#util#exceptwrapper('vimsynctex#view')
command! SynctexForward :call vimsynctex#util#exceptwrapper('vimsynctex#forward')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
