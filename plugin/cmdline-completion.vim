if !exists('g:cmdline_completion') | let g:cmdline_completion = {} | endif | let s:c = g:cmdline_completion

" what to use here?
" <c-x><c-o/u> or <c-n> or something else
let s:c.lhs = get(s:c, 'lhs', '<c-l>')

exec 'cnoremap '.s:c.lhs." <c-r>=cmdline_completion#Store()<cr><c-a><C-\\>ecmdline_completion#Matches()<cr><esc>:call cmdline_completion#SelectRestart()<cr>"

" exec 'cmap '. s:c.lhs .' <C-\>ecmdline_completion#Select()<CR>'
