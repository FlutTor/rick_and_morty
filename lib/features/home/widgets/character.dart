import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({
    required this.urlImage,
    required this.title,
    required this.text1,
    required this.text2,
    required this.text3,
    Key? key,
  }) : super(key: key);

  final String urlImage;
  final String title;
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              urlImage,
              height: 60,
            ),
            const SizedBox(height: 8),
            Text(title),
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
                    text1,
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
                Text(text2),
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
                Text(text3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
