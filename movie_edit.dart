import 'package:flutter/material.dart';

import 'movie.dart';
import 'movie_details.dart';

class MovieEdit extends StatefulWidget {
  final Movie movie;
  
  MovieEdit(this.movie);

  @override
  _MovieEditState createState() => _MovieEditState(movie);
}

class _MovieEditState extends State<MovieEdit> {
  final Movie movie;
  var url = "https://image.tmdb.org/t/p/w500";

  _MovieEditState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title,
              maxLines: 2,
              softWrap: true,
              ),
              background: Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(url + movie.backdropPath),
                    fit: BoxFit.fill,
                  )
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: MovieDetails(movie),
          ),
        ],
      ),
      
    );
  }
}