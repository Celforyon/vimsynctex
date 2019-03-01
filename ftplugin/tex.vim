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

command! SynctexView :call vimsynctex#view()
command! SynctexForward :call vimsynctex#forward()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
