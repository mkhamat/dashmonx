String _wrap(String text, String code) {
  return '\x1b[${code}m$text\x1b[0m';
}

String green(String text) => _wrap(text, '32');
String red(String text) => _wrap(text, '31');
String cyan(String text) => _wrap(text, '36');
String yellow(String text) => _wrap(text, '33');
String bold(String text) => _wrap(text, '1');
String dim(String text) => _wrap(text, '2');

String colorize(String line) {
  // Errors
  if (line.startsWith('Error:') ||
      line.startsWith('Exception:') ||
      line.contains('FAILURE')) {
    return red(line);
  }

  // Warnings
  if (line.startsWith('Warning:') || line.startsWith('!')) {
    return yellow(line);
  }

  // Success
  if (line.contains('Reloaded') && line.contains('libraries')) {
    return green(line);
  }
  if (line.startsWith('Syncing files to device')) {
    return green(line);
  }

  // Info
  if (line.startsWith('Launching lib/') ||
      line.startsWith('Running Gradle') ||
      line.startsWith('Xcode build done') ||
      line.startsWith('Built build/')) {
    return cyan(line);
  }

  return line;
}
