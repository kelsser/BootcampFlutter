import 'package:flutter/material.dart';

class MovieTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Text(
        "Top Filmes",
        style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold
        ), textAlign: TextAlign.left,
      ),
    );
  }
}
