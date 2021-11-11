import 'package:flutter/material.dart';
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
      body: Column(
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
                  builder: (context, AsyncSnapshot<List<Character>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 180,
                            child: Card(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(
                                    snapshot.data![index].image,
                                    height: 60,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(snapshot.data![index].name),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    textBaseline: TextBaseline.alphabetic,
                                    textDirection: TextDirection.ltr,
                                    children: [
                                      const Card(
                                        color: Colors.blue,
                                        elevation: 5,
                                        margin: EdgeInsets.all(8),
                                        child: Text(
                                          ' Specie: ',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      SizedBox(
                                        width: 60,
                                        child: Text(
                                          snapshot.data![index].species,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        color: Colors.red[300],
                                        elevation: 5,
                                        margin: const EdgeInsets.all(8),
                                        child: const Text(
                                          ' Gender: ',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(snapshot.data![index].gender),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        color: Colors.green[100],
                                        elevation: 5,
                                        margin: const EdgeInsets.all(8),
                                        child: const Text(
                                          ' Status: ',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(snapshot.data![index].status),
                                    ],
                                  ),
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
          ),
          const Expanded(
            flex: 2,
            child: FlutterLogo(
              size: 400,
            ),
          ),
          const Expanded(
            flex: 8,
            child: FlutterLogo(
              size: 400,
            ),
          ),
        ],
      ),
    );
  }
}
