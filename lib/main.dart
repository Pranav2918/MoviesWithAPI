import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:usersapi/model/movies.dart';
import 'package:http/http.dart' as http;
import 'package:usersapi/widget/movietile.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  List<Movie> _movies = <Movie>[];

  @override
  void initState() {
    super.initState();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    final movies = await _fetchAllMovies();
    setState(() {
      _movies = movies;
    });
  }

  Future<List<Movie>> _fetchAllMovies() async {
    final response = await http.get(
        Uri.parse("http://www.omdbapi.com/?s=Batman&page=2&apikey=564727fa"));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Movies App",
        home: Scaffold(
            appBar: AppBar(title: Text("Movies")),
            body: MoviesWidget(movies: _movies)));
  }
}
