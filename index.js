// parses unified diff
// http://www.gnu.org/software/diffutils/manual/diffutils.html#Unified-Format
    file.new = true;
      oldStart,
      oldLines,
      newStart,
      newLines
    var recentChange, ref;
    return current.changes.push({
      type: recentChange.type,
      [`${recentChange.type}`]: true,
      ln1: recentChange.ln1,
      ln2: recentChange.ln2,
      ln: recentChange.ln,
      content: line
    });
  // todo beter regexp to avoid detect normal line starting with diff
// fallback function to overwrite file.from and file.to if executed
  // ignore possible time stamp
  // ignore git prefixes a/ or b/