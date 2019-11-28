import 'package:flutter/material.dart';
import 'movie.dart';

class MovieEditBody extends StatefulWidget {
  final Movie movie;

  MovieEditBody(this.movie);

  @override
  _MovieEditBodyState createState() => _MovieEditBodyState(movie);
}

class _MovieEditBodyState extends State<MovieEditBody> {
  final Movie movie;
  var url = "https://image.tmdb.org/t/p/w500";
  var _formkey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _popularityController = TextEditingController();
  TextEditingController _voteController = TextEditingController();

  _MovieEditBodyState(this.movie) {
    _titleController.text = movie.title;
    _descriptionController.text = movie.overview;
    _yearController.text = movie.releaseDate.toString();
    _popularityController.text = movie.popularity.toString();
    _voteController.text = movie.voteAverage.toString();
    // _yearController.text = movie.releaseDate.toString().replaceRange(7, 23, '').replaceRange(0, 5, '') +
    //   '/' +
    //   movie.releaseDate.toString().replaceRange(10, 23, '').replaceRange(0, 8, '') +
    //   '/' +
    //   movie.releaseDate.toString().replaceRange(4, 23, '');
    //   //Desculpa Thiago, eu realmente não estava nem um pouco afim de entender como um RegEx funciona ¯\_(ツ)_/¯
    // _popularityController.text = movie.popularity.toString() +
    //   ' visualizações';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Form(
        autovalidate: true,
        key: _formkey,
        child: Wrap(
          //runSpacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          //spacing: 25,
          children: <Widget>[
            Text('Título:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 2, //Talvez isso seja gambiarra
              ),
            ),
            TextFormField(
              validator: (value) {
                if(value.isEmpty) {
                  return "Valor não pode ser vazio!";
                }
                return null;
              },
              controller: _titleController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: "Escreva o título do filme."
              ),
            ),
            Text('Descrição:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 2,
              ),
            ),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: "Escreva uma descrição."
              ),
            ),
            Text('Lançamento do Filme:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 2,
              ),
            ),
            TextField(
              controller: _yearController,
              maxLength: 23,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: "Data de lançamento."
              ),
            ),
            Text('Popularidade:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 2,
              ),
            ),
            TextField(
              controller: _popularityController,
              readOnly: true,
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: "Nota de popularidade do filme."
              ),
            ),
            Text('Nota do Filme:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 2,
              ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              controller: _voteController,
              maxLength: 3,
              maxLengthEnforced: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: "Avaliação do filme."
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Color.fromRGBO(0, 0, 255, 1),
                child: Text("Salvar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                onPressed: () {
                  if(_formkey.currentState.validate() &&
                      _descriptionController.text.length > 0) {
                        movie.title = _titleController.text;
                        movie.overview = _descriptionController.text;
                        movie.releaseDate = DateTime.parse(_yearController.text);
                        movie.popularity = double.parse(_popularityController.text);
                        movie.voteAverage = (movie.voteAverage +
                          double.parse(_voteController.text)) /
                          2;

                        Navigator.of(context).pop(movie);
                      }
                },
              ),
            )
          ],
      ))
    );
  }
}