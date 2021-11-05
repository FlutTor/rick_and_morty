// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'package:http/http.dart';
import 'package:rick_and_morty/models/character.dart';

class CharacterApi {
  List<Character> characters = [];

  Future<List<Character>> getCharacters() async {
    final url = Uri.parse('https://rickandmortyapi.com/api/character/');
    final response = await get(url);

    final responseJson = jsonDecode(response.body.toString()) as List;
    final charactersList = createCharacterList(responseJson);
    return charactersList;
  }

  List<Character> createCharacterList(List data) {
    final lists = <Character>[];
    for (var i = 0; i < data.length; i++) {
      final name = data[i]['name'] as String;
      final status = data[i]['status'] as String;
      final species = data[i]['species'] as String;
      final gender = data[i]['gender'] as String;
      final urlImage = data[i]['urlImage'] as String;

      final characters = Character(
        name: name,
        gender: gender,
        species: species,
        status: status,
        urlImage: urlImage,
      );
      lists.add(characters);
    }
    return lists;
  }
}
