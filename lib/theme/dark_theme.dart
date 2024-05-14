import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  canvasColor: Colors.grey[900],
  scaffoldBackgroundColor: Colors.grey[900],
  cardColor: Colors.grey[800],
  dividerColor: Colors.white54,
  highlightColor: Colors.white10,
  splashColor: Colors.white24,
  unselectedWidgetColor: Colors.white70,
  disabledColor: Colors.white30,
  secondaryHeaderColor: Colors.grey[600],
  dialogBackgroundColor: Colors.grey[800],
  indicatorColor: Colors.tealAccent,
  hintColor: Colors.white70,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
      .copyWith(secondary: Colors.tealAccent),
);
