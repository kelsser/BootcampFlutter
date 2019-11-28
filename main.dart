import 'package:flutter/material.dart';

import 'list_movie.dart';

const String MovieEditScreen = '/movie_edit';
const String MovieDetailsScreen = '/movie_details';
const String MovieListScreen = '/movie_list';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MovieList(),
  ));
}
