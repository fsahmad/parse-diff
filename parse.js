  let currentFileChanges = null;
    currentFileChanges.oldLines--;
    currentFileChanges.newLines--;
  const toNumOfLines = (number) => +(number || 1);

      oldLines: toNumOfLines(oldNumLines),
      newLines: toNumOfLines(newNumLines),
    };
    currentFileChanges = {
      oldLines: toNumOfLines(oldNumLines),
      newLines: toNumOfLines(newNumLines),
    currentFileChanges.oldLines--;
    currentFileChanges.newLines--;
  const schemaHeaders = [
    [/^\\ No newline at end of file$/, eof],
  ];

  const schemaContent = [
    [/^\s+/, normal],
  const parseContentLine = (line) => {
    for (const [pattern, handler] of schemaContent) {
        break;
    if (
      currentFileChanges.oldLines === 0 &&
      currentFileChanges.newLines === 0
    ) {
      currentFileChanges = null;
    }
  };

  const parseHeaderLine = (line) => {
    for (const [pattern, handler] of schemaHeaders) {
      const match = line.match(pattern);
      if (match) {
        handler(line, match);
        break;
      }
    }
  };

  const parseLine = (line) => {
    if (currentFileChanges) {
      parseContentLine(line);
    } else {
      parseHeaderLine(line);
    }
    return;