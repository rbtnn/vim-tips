
scriptencoding utf-8

let s:script_dir = expand('<sfile>:h')

function! s:main() abort
	let lines = [
		\ '# vim-tips',
		\ 'Vim scriptのTipsを日本語ヘルプでまとめることが目的です。  ',
		\ '備忘録的な感じで扱っていきたいのでVim scriptのよくあるパターンなどを入れるつもりです。  ',
		\ '',
		\ '## Tips一覧',
		\ ]
	let lnum = 0
	for line in readfile(s:script_dir .. '/doc/tips.jax')
		let lnum += 1
		let m = matchlist(line, '^\(.\{-\}\)\s*\*tips_\d\+\*$')
		if !empty(m)
			let lines += [printf('+ [%s](%s)',
				\ m[1],
				\ 'https://github.com/rbtnn/vim-tips/blob/main/doc/tips.jax#L' .. lnum)]
		endif
	endfor
	let lines += [
		\ '',
		\ '## License',
		\ 'Distributed under MIT License. See LICENSE.',
		\ ]
	call writefile(lines, s:script_dir .. '/README.md')
endfunction

call s:main()

