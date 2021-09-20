import 'package:flutter/cupertino.dart';

enum PokemonTypes {
  normal,
  fire,
  water,
  grass,
  electric,
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

extension PokemonTypesExtension on PokemonTypes {
  String get displayTitle {
    return this.toString().split(".")[1].substring(0, 1).toUpperCase() +
        this.toString().split(".")[1].substring(1);
  }
}

Map<PokemonTypes, Color> pokemonTypeColors = <PokemonTypes, Color>{
  PokemonTypes.normal: Color.fromRGBO(145, 180, 202, 1.0),
  PokemonTypes.fire: Color.fromRGBO(249, 108, 108, 1.0),
  PokemonTypes.water: Color.fromRGBO(118, 189, 254, 1.0),
  PokemonTypes.grass: Color.fromRGBO(72, 208, 176, 1.0),
  PokemonTypes.electric: Color.fromRGBO(252, 216, 111, 1.0),
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
  late int id;
  late String name;
  late int height;
  late int weight;
  late int baseExperience;
  late PokemonTypes type;
  late String image;
  late List<Ability> abilities;
  late List<Move> moves;

  Pokemon({
    required this.name,
    required this.type,
    required this.image,
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"].substring(0, 1).toUpperCase() +
        json["name"].toString().substring(1);
    type = PokemonTypes.values.firstWhere((e) =>
        e.toString() == "PokemonTypes." + json["types"][0]["type"]["name"]);
    height = json["height"];
    weight = json["weight"];
    baseExperience = json["base_experience"];
    image = json["sprites"]["other"]["official-artwork"]["front_default"];
    json["abilities"].map((e) => abilities.add(Ability.fromJson(e["ability"])));
    // json["moves"].map((e) => moves.add(Move.fromJson(e["move"])));
  }
}

class Ability {
  late String name;
  late String url;
  late int id;

  Ability.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    url = json["url"];
    id = int.parse(json['url'].toString().split('/').last);
  }
}

class Move {
  late String name;
  late int id;
  late String url;
  late PokemonTypes moveType;

  Move.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    id = int.parse(json['url'].toString().split('/').last);
    moveType = PokemonTypes.values.firstWhere(
        (e) => e.toString() == "PokemonTypes." + json["type"]["name"]);
  }
}

List<Pokemon> poke = [];
