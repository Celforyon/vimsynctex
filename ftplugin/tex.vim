" vimsynctex
" Maintainer: Alexis Pereda
" Version: 1

"""""""""""""""" Variables """"""""""""""""""""""""""""

if !exists('g:vimsynctex_viewer')
	let g:vimsynctex_viewer = 'zathura'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Functions """"""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Commands """""""""""""""""""""""""""""

command! SynctexView :call vimsynctex#util#exceptwrapper('vimsynctex#view')
command! SynctexForward :call vimsynctex#util#exceptwrapper('vimsynctex#forward')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""