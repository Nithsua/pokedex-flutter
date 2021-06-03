import 'package:flutter/cupertino.dart';
import 'package:pokedex/model/theme_model.dart';
import 'package:pokedex/view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      home: HomeView(),
    );
  }
}
