fun! cmdline_completion#Store()
  let s:pos = getcmdpos()
  let s:line = getcmdline()
  let g:line1 = s:line
  return ""
endf

fun! cmdline_completion#Matches()
  let line = getcmdline()
  let g:line2 = line
  " TODO: cope with escaping
  let matches = split(line[(s:pos)-1:-(len(s:line)-s:pos)-2],' ')

  " memorize chars left of cursor and right of cursor and the matching items
  let s:mem = [s:line[0:(s:pos)-2], matches, s:line[(s:pos)-1:-1]]
  return ""
endf

fun! cmdline_completion#SelectRestart()
  let word = matchstr(s:mem[0], '\zs\S*$')
  let s:mem[1][0] =  word.s:mem[1][0]
  let m = tlib#input#List('s','select file',  s:mem[1])
  " drop partially typed word
  call feedkeys(":" . s:mem[0] . m[len(word):-1] . s:mem[2]. repeat("\<left>", len(s:mem[2])), 'n')
endf
