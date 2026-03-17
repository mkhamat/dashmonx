import 'dart:io';

void clearLine() => stdout.write('\r\x1b[2K');

void clearScreen() => stdout.write('\x1b[2J\x1b[H');

void setTitle(String title) => stdout.write('\x1b]0;$title\x07');

void resetTitle() => stdout.write('\x1b]0;\x07');
