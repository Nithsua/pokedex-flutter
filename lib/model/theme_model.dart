import 'package:flutter/cupertino.dart';

final CupertinoThemeData lightTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle:
        TextStyle(fontFamily: "BalsamiqSans", color: CupertinoColors.black),
  ),
  barBackgroundColor: CupertinoColors.white,
  scaffoldBackgroundColor: CupertinoColors.white,
  primaryColor: CupertinoColors.black,
);

final CupertinoThemeData darkTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle:
        TextStyle(fontFamily: "BalsamiqSans", color: CupertinoColors.white),
  ),
  barBackgroundColor: CupertinoColors.black,
  scaffoldBackgroundColor: CupertinoColors.black,
  primaryColor: CupertinoColors.white,
);
