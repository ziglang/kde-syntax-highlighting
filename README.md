# Zig Syntax Highlighting for KDE

## Installation

In order to test it, xml file has to be placed in `/usr/share/katepart5/syntax/` or `$HOME/.local/share/org.kde.syntax-highlighting/syntax/` or for windows `%USERPROFILE%\AppData\Local\org.kde.syntax-highlighting\syntax\` or check [kde docs](https://docs.kde.org/trunk5/en/kate/katepart/highlight.html#katehighlight-xml-format). Then, Zig sources should be detected automatically by editors that uses KDE's text editor part.

## Missing Features

 * keywords and other syntax are not auto generated from zig compiler introspection
