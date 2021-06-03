import 'package:flutter/Cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex/view/pokedex_view.dart';
import 'package:pokedex/widget/search_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // backgroundColor: CupertinoColors.black,
        border: Border.all(width: 0.0, style: BorderStyle.none),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What Pokemon\nare you lookin\' for?',
                  style: TextStyle(
                    fontFamily: "BalsamiqSans",
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: SearchBar(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child: CupertinoButton(
                    padding: const EdgeInsets.all(10.0),
                    color: CupertinoColors.systemRed,
                    onPressed: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) {
                        return PokedexView();
                      }));
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Pokedex',
                              style: TextStyle(
                                fontSize: 20,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                          Icon(
                            CupertinoIcons.arrow_right,
                            color: CupertinoColors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
