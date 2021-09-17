// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';

class AnsiParser {
  static const TEXT = 0, BRACKET = 1, CODE = 2;

  final bool dark;

  AnsiParser(this.dark);

  Color? foreground;
  Color? background;
  late List<TextSpan> spans;

  void parse(String s) {
    spans = [];
    var state = TEXT;
    late StringBuffer buffer;
    var text = StringBuffer();
    var code = 0;
    late List<int> codes;

    for (var i = 0, n = s.length; i < n; i++) {
      var c = s[i];

      switch (state) {
        case TEXT:
          if (c == '\u001b') {
            state = BRACKET;
            buffer = StringBuffer(c);
            code = 0;
            codes = [];
          } else {
            text.write(c);
          }
          break;

        case BRACKET:
          buffer.write(c);
          if (c == '[') {
            state = CODE;
          } else {
            state = TEXT;
            text.write(buffer);
          }
          break;

        case CODE:
          buffer.write(c);
          var codeUnit = c.codeUnitAt(0);
          if (codeUnit >= 48 && codeUnit <= 57) {
            code = code * 10 + codeUnit - 48;
            continue;
          } else if (c == ';') {
            codes.add(code);
            code = 0;
            continue;
          } else {
            if (text.isNotEmpty) {
              spans.add(createSpan(text.toString()));
              text.clear();
            }
            state = TEXT;
            if (c == 'm') {
              codes.add(code);
              // coloring
              handleCodes(codes);
            } else {
              text.write(buffer);
            }
          }
          break;
      }
    }
    spans.add(createSpan(text.toString()));
  }

  void handleCodes(List<int> codes) {
    if (codes.isEmpty) {
      codes.add(0);
    }
    switch (codes[0]) {
      case 0:
        foreground = getColor(0, true);
        background = getColor(0, false);
        break;
      case 38:
        foreground = getColor(codes[2], true);
        break;
      case 39:
        foreground = getColor(0, true);
        break;
      case 48:
        background = getColor(codes[2], false);
        break;
      case 49:
        background = getColor(0, false);
    }
  }

  Color? getColor(int colorCode, bool foreground) {
    Color? color;
    switch (colorCode) {
      case 0:
        color = foreground ? Colors.black : Colors.transparent;
        break;
      case 12:
        color = (dark ? Colors.lightBlue[300] : Colors.indigo[700])!;
        break;
      case 208:
        color = (dark ? Colors.orange[300] : Colors.orange[700])!;
        break;
      case 196:
        color = (dark ? Colors.red[300] : Colors.red[700])!;
        break;
      case 199:
        color = (dark ? Colors.pink[300] : Colors.pink[700])!;
        break;
    }
    return color;
  }

  TextSpan createSpan(String text) {
    // TODO: this is temp solution for align printer
    // in my test phone,only iOS has align issue
    if (Platform.isIOS && text.startsWith("│")) {
      text = '\u001b$text';
    }
    return TextSpan(
      text: text,
      style: TextStyle(
        color: foreground,
        backgroundColor: background,
      ),
    );
  }
}
