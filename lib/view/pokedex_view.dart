import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          border: Border.all(width: 0.0, style: BorderStyle.none),
          // leading: CupertinoButton(
          //     child: Icon(
          //       CupertinoIcons.back,
          //       size: 30.0,
          //       color: CupertinoTheme.of(context).primaryColor,
          //     ),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     }),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
              child: Column(
                children: [
                  Text(
                    'Pokedex',
                    style: TextStyle(
                      fontFamily: "BalsamiqSans",
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GridView.builder(
                    itemCount: 1,
                      gridDelegate: gridDelegate,
                      itemBuilder: (context, count) {
                        return Container();
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
