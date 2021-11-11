// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'package:http/http.dart';
import 'package:rick_and_morty/models/models.dart';

Future<List<Location>> getLocations() async {
  final url = Uri.parse(
      'https://rickandmortyapi.com/api/location/1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30');
  final response = await get(url);

  final responseJson = jsonDecode(response.body.toString()) as List;
  final locationsList = createLocationsList(responseJson);
  return locationsList;
}

List<Location> createLocationsList(List data) {
  final lists = <Location>[];
  for (var i = 0; i < data.length; i++) {
    final name = data[i]['name'] as String;
    final type = data[i]['type'] as String;
    final dimension = data[i]['dimension'] as String;
    final created = data[i]['created'] as String;

    final locations = Location(
      name: name,
      type: type,
      dimension: dimension,
      created: created,
    );
    lists.add(locations);
  }
  return lists;
}
