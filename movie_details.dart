import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_edit.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;

  MovieDetails(this.movie);

  @override
  _MovieDetailsState createState() => _MovieDetailsState(movie);
}

class _MovieDetailsState extends State<MovieDetails> {
  final Movie movie;
  var url = "https://image.tmdb.org/t/p/w500";

  _MovieDetailsState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Text('Título:',
            strutStyle: StrutStyle(height: 2),
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 20,
              ),
            ),
            Text(movie.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text('Descrição:',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 20,
                height: 2,
              ),
            ),
            Text(movie.overview,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text('Lançamento do Filme:',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 20,
                height: 2,
              ),
            ),
            Text(movie.releaseDate.toString().replaceRange(10, 23, ''),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text('Popularidade:',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 20,
                height: 2,
              ),
            ),
            Text(movie.popularity.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text('Nota do Filme:',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 20,
                height: 2,
              ),
            ),
            Text(movie.voteAverage.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Color.fromRGBO(0, 0, 255, 1),
                child: Text("Editar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MovieEdit(movie)));
                },
              ),
            )
          ],
      ))
    ));
  }
}