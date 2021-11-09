// ignore_for_file: avoid_dynamic_calls, prefer_final_locals

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/models.dart';

Future<List<Character>> getCharacters() async {
  final url = Uri.parse(
      'https://rickandmortyapi.com/api/character/1,183,24,34,4,45,65,72,81,98');
  final response = await http.get(url);

  final responseJson = jsonDecode(response.body.toString()) as List;
  var charactersList = createCharacterList(responseJson);
  return charactersList;
}

List<Character> createCharacterList(List data) {
  var lists = <Character>[];
  for (var i = 0; i < data.length; i++) {
    final name = data[i]['name'] as String;
    final status = data[i]['status'] as String;
    final species = data[i]['species'] as String;
    final gender = data[i]['gender'] as String;
    final image = data[i]['image'] as String;

    final characters = Character(
      name: name,
      gender: gender,
      species: species,
      status: status,
      image: image,
    );
    lists.add(characters);
  }
  return lists;
}
