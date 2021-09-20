import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: CupertinoColors.white,
  ),
  scaffoldBackgroundColor: CupertinoColors.white,
  primaryColor: CupertinoColors.black,
);

final ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: CupertinoColors.black,
  ),
  scaffoldBackgroundColor: CupertinoColors.black,
  primaryColor: CupertinoColors.white,
);
