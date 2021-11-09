// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'package:http/http.dart';
import 'package:rick_and_morty/models/models.dart';

class EpisodeApi {
  List<Episode> episodes = [];

  Future<List<Episode>> getEpisodes() async {
    final url = Uri.parse('https://rickandmortyapi.com/api/episode/');
    final response = await get(url);

    final responseJson = jsonDecode(response.body.toString()) as List;
    final episodesList = createEpisodesList(responseJson);
    return episodesList;
  }

  List<Episode> createEpisodesList(List data) {
    final lists = <Episode>[];
    for (var i = 0; i < data.length; i++) {
      final name = data[i]['name'] as String;
      final airDate = data[i]['air_date'] as String;
      final episode = data[i]['episode'] as String;

      final episodes = Episode(
        name: name,
        airDate: airDate,
        episode: episode,
      );
      lists.add(episodes);
    }
    return lists;
  }
}
