import 'package:bootcamp_flutter/movie.dart';
import 'package:flutter/material.dart';

class MovieCell extends StatelessWidget {
  final List<Movie> movies;
  final i;
  final url = 'https://image.tmdb.org/t/p/w500/';

  MovieCell(this.movies, this.i);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Container(
                margin: EdgeInsets.all(16),
                width: 120,
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(url + movies[i].posterPath),
                        fit: BoxFit.cover)),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    movies[i].title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Arvo',
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                  Text(
                    movies[i].overview,
                    maxLines: 3,
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 20,
                        fontFamily: 'Arvo',
                    ),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )
          ],
        )
      ],
    );
  }
}
