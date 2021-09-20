import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/service/poke_api.dart';
import 'package:pokedex/view/pokemon_view.dart';

class HomeView extends StatelessWidget {
  final String title = "Pokedex";
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 120,
            stretch: true,
            // onStretchTrigger: () {
            // return pokeApi.getWithLimit();
            // },
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 20.0),
              centerTitle: false,
              // stretchModes: <StretchMode>[StretchMode.fadeTitle],
              title: Text(
                'Pokedex',
                style: TextStyle(
                  fontFamily: "BalsamiqSans",
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            // title:  Text(
            //   'Pokedex',
            //   style: TextStyle(
            //     fontFamily: "BalsamiqSans",
            //     fontWeight: FontWeight.w700,
            //     color: Theme.of(context).primaryColor,
            //   ),
            // ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: FutureBuilder(
                      future: pokeApi.getWithLimit(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: poke.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1.5,
                                      crossAxisCount:
                                          (MediaQuery.of(context).orientation ==
                                                  Orientation.portrait)
                                              ? 2
                                              : 3),
                              itemBuilder: (context, count) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => PokemonView(
                                                  title: poke[count].name,
                                                  previousTitle: title,
                                                  pokemonIndex: count,
                                                )));
                                  },
                                  child: Card(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    color: pokemonTypeColors[poke[count].type],
                                    child: Stack(children: [
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: Image.network(
                                          poke[count].image,
                                          height: 80,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0,
                                            bottom: 10.0,
                                            left: 20.0,
                                            right: 1.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20.0),
                                              child: Text(
                                                poke[count].name,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              color:
                                                  Colors.grey.withOpacity(0.4),
                                              elevation: 0.0,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0,
                                                        horizontal: 8.0),
                                                child: Text(
                                                  poke[count].type.displayTitle,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                );
                              });
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                                child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              color: Colors.black,
                            )),
                          );
                        }
                      }),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
