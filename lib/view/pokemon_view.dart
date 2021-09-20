import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/view/poke_info_view/about_view.dart';
import 'package:pokedex/view/poke_info_view/base_stat_view.dart';
import 'package:pokedex/view/poke_info_view/evolution_view.dart';
import 'package:pokedex/view/poke_info_view/moves_view.dart';

class PokemonView extends StatefulWidget {
  final String title;
  final String previousTitle;
  final int pokemonIndex;
  PokemonView(
      {Key? key,
      required this.title,
      required this.previousTitle,
      required this.pokemonIndex})
      : super(key: key);

  @override
  _PokemonViewState createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pokemonTypeColors[poke[widget.pokemonIndex].type],
        body: NestedScrollView(
          physics: ClampingScrollPhysics(),
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 120.0,
                stretch: true,
                // floating: true,
                // snap: true,
                backgroundColor:
                    pokemonTypeColors[poke[widget.pokemonIndex].type],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsets.only(left: 20.0),
                  title: Text(
                    widget.title,
                    style: TextStyle(
                        fontFamily: "BalsamiqSans",
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                // snap: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    color: pokemonTypeColors[poke[widget.pokemonIndex].type],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              color: Colors.grey.withOpacity(0.4),
                              elevation: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 8.0),
                                child: Text(
                                  poke[widget.pokemonIndex].type.displayTitle,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.network(
                          poke[widget.pokemonIndex].image,
                          height: MediaQuery.of(context).size.height / 4.5,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ];
          },
          body: SafeArea(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 20.0, right: 20.0, bottom: 5.0),
                child: Column(
                  children: [
                    TabBar(
                      labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: "BalsamiqSans",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: "BalsamiqSans",
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                      ),
                      tabs: [
                        Tab(
                          text: 'About',
                        ),
                        Tab(
                          text: 'Base Stat',
                        ),
                        Tab(
                          text: 'Evolution',
                        ),
                        Tab(
                          text: 'Moves',
                        ),
                      ],
                    ),
                    Flexible(
                      child: TabBarView(
                        physics: BouncingScrollPhysics(),
                        controller: _tabController,
                        children: [
                          AboutView(),
                          BaseStatView(),
                          EvolutionView(),
                          MovesView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
