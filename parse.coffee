	current = null
	start = (line) ->
			chunks: []
		if not file.to and not file.from
			fileNames = parseFile line

			if fileNames
				file.from = fileNames[0]
				file.to = fileNames[1]

		start() if not file || file.chunks.length
		file.from = '/dev/null'
		file.to = '/dev/null'
		file.from = parseFileFallback line
		file.to = parseFileFallback line
		ln_del = oldStart = +match[1]
		oldLines = +(match[2] || 0)
		ln_add = newStart = +match[3]
		newLines = +(match[4] || 0)
		current = {
			content: line,
			changes: [],
			oldStart, oldLines, newStart, newLines
		}
		file.chunks.push current
		current.changes.push {type:'del', del:true, ln:ln_del++, content:line}
		current.changes.push {type:'add', add:true, ln:ln_add++, content:line}
		current.changes.push {
		[/^\s+/, normal]
		[/^---\s/, from_file],
		[/^\+\+\+\s/, to_file],
		parse line
	return if not s

	fileNames = s.split(' ').slice(-2)
	fileNames.map (fileName, i) ->
		fileNames[i] = fileName.replace(/^(a|b)\//, '')

	return fileNames

# fallback function to overwrite file.from and file.to if executed
parseFileFallback = (s) ->
	s = ltrim s, '-'
	s = ltrim s, '+'
	t = (/\t.*|\d{4}-\d\d-\d\d\s\d\d:\d\d:\d\d(.\d+)?\s(\+|-)\d\d\d\d/).exec(s)

ltrim = (s, chars) ->
	s = makeString(s)
	return trimLeft.call(s) if !chars and trimLeft
	chars = defaultToWhiteSpace(chars)
	return s.replace(new RegExp('^' + chars + '+'), '')

makeString = (s) -> if s == null then '' else s + ''

trimLeft = String.prototype.trimLeft

defaultToWhiteSpace = (chars) ->
  return '\\s' if chars == null
  return chars.source if chars.source
  return '[' + escapeRegExp(chars) + ']'

escapeRegExp = (s) ->
	makeString(s).replace(/([.*+?^=!:${}()|[\]\/\\])/g, '\\$1')