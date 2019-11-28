import 'package:flutter/material.dart';
import 'movie.dart';

class MovieInfo extends StatefulWidget {
  final Movie movie;

  MovieInfo(this.movie);

  @override
  _MovieInfoState createState() => _MovieInfoState(movie);
}

class _MovieInfoState extends State<MovieInfo> {
  final Movie movie;

  _MovieInfoState(this.movie);

  @override
Widget build(BuildContext context) {
  return Directionality(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(Icons.album),
            title: Text("movie.originalTitle"),
            subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          ButtonTheme.bar( // make buttons use the appropriate styles for cards
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () { /* ... */ },
                ),
                FlatButton(
                  child: const Text('LISTEN'),
                  onPressed: () { /* ... */ },
                ),
              ],
            ),
          ),
        ],
      ),
    ), textDirection: TextDirection.ltr,
  );
}
}