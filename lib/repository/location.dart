// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'package:http/http.dart';
import 'package:rick_and_morty/models/models.dart';

class LocationApi {
  List<Location> locations = [];

  Future<List<Location>> getLocations() async {
    final url = Uri.parse('https://rickandmortyapi.com/api/location/');
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

      final locations = Location(
        name: name,
        type: type,
        dimension: dimension,
      );
      lists.add(locations);
    }
    return lists;
  }
}
