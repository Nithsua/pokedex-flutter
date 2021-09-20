import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemon_model.dart';

class PokeApi {
  Future<void> getWithLimit({int limit = 10, int offset = 0}) async {
    Uri url = Uri(
        scheme: "https",
        host: "pokeapi.co",
        path: "/api/v2/pokemon",
        query: "limit=" + limit.toString() + "&offset" + offset.toString());
    Map<String, dynamic> json = await getParticularInfo(url);
    for (int i = 0; i < json["results"].length; i++) {
      poke.add(Pokemon.fromJson(
          await getParticularInfo(Uri.parse(json["results"][i]["url"]))));
    }
  }

  Future<Map<String, dynamic>> getParticularInfo(Uri url) async {
    http.Response response = await http.get(url);
    print(response.statusCode);
    // print(response.body);
    Map<String, dynamic> json = jsonDecode(response.body);
    return json;
  }
}

PokeApi pokeApi = PokeApi();
