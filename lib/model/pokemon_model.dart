import 'package:flutter/cupertino.dart';

enum PokemonTypes {
  normal,
  fire,
  water,
  grass,
  electic,
  ice,
  fighting,
  poison,
  ground,
  flying,
  psychic,
  bug,
  rock,
  ghost,
  dark,
  dragon,
  steel,
  fairy
}

Map<PokemonTypes, Color> pokemonTypeColors = <PokemonTypes, Color>{
  PokemonTypes.normal: Color.fromRGBO(145, 180, 202, 1.0),
  PokemonTypes.fire: Color.fromRGBO(240, 129, 49, 1.0),
  PokemonTypes.water: Color.fromRGBO(104, 144, 240, 1.0),
  PokemonTypes.grass: Color.fromRGBO(120, 200, 80, 1.0),
  PokemonTypes.electic: Color.fromRGBO(249, 207, 48, 1.0),
  PokemonTypes.ice: Color.fromRGBO(152, 216, 216, 1.0),
  PokemonTypes.fighting: Color.fromRGBO(193, 59, 41, 1.0),
  PokemonTypes.poison: Color.fromRGBO(161, 76, 160, 1.0),
  PokemonTypes.ground: Color.fromRGBO(224, 192, 104, 1.0),
  PokemonTypes.flying: Color.fromRGBO(168, 144, 240, 1.0),
  PokemonTypes.psychic: Color.fromRGBO(237, 88, 136, 1.0),
  PokemonTypes.bug: Color.fromRGBO(169, 184, 33, 1.0),
  PokemonTypes.rock: Color.fromRGBO(184, 160, 57, 1.0),
  PokemonTypes.ghost: Color.fromRGBO(112, 88, 152, 1.0),
  PokemonTypes.dark: Color.fromRGBO(112, 88, 72, 1.0),
  PokemonTypes.dragon: Color.fromRGBO(119, 104, 249, 1.0),
  PokemonTypes.steel: Color.fromRGBO(184, 184, 208, 1.0),
  PokemonTypes.fairy: Color.fromRGBO(240, 182, 189, 1.0),
};

class Pokemon {
  int id;
  String name;
  double height;
  double weight;
  int baseExperience;
  PokemonTypes type;
  Color color;
}
