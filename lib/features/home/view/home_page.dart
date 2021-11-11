import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/home/home.dart';
import 'package:rick_and_morty/l10n/l10n.dart';
import 'package:rick_and_morty/models/models.dart';
import 'package:rick_and_morty/repository/repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Character',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Expanded(
              flex: 5,
              child: Center(
                child: Card(
                  color: Colors.black12,
                  child: FutureBuilder(
                    future: getCharacters(),
                    builder:
                        (context, AsyncSnapshot<List<Character>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return CharacterWidget(
                              urlImage: snapshot.data![index].image,
                              title: snapshot.data![index].name,
                              text1: snapshot.data![index].species,
                              text2: snapshot.data![index].gender,
                              text3: snapshot.data![index].status,
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error!.toString());
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ),
            const Text('Episodes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.black12,
                child: FutureBuilder(
                  future: getEpisodes(),
                  builder: (context, AsyncSnapshot<List<Episode>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            // TODO: Future Modularize
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(snapshot.data![index].name),
                                  Text(snapshot.data![index].episode),
                                  Text(snapshot.data![index].airDate),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error!.toString());
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
            const Text('Locations',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Expanded(
              flex: 2,
              child: Card(
                color: Colors.black12,
                child: FutureBuilder(
                  future: getLocations(),
                  builder: (context, AsyncSnapshot<List<Location>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            // TODO: Future Modularize
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(snapshot.data![index].name),
                                  Text(snapshot.data![index].type),
                                  Text(snapshot.data![index].dimension),
                                  Text(
                                      '${DateTime.parse(snapshot.data![index].created).toLocal().day.toString()}/${DateTime.parse(snapshot.data![index].created).toLocal().month.toString()}/${DateTime.parse(snapshot.data![index].created).toLocal().year.toString()}'),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error!.toString());
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
