import 'package:flutter/material.dart';
import 'package:usersapi/model/movies.dart';

class MoviesWidget extends StatelessWidget {
  final List<Movie> movies;
  MoviesWidget({required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (movieContext, index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 100,
                    child: ClipRRect(
                      child: Image.network(movies[index].poster),
                      borderRadius: BorderRadius.circular(10),
                    )),
                Flexible(
                    child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movies[index].title,
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        movies[index].year,
                        style: TextStyle(fontSize: 12, color: Colors.red),
                      ),
                      Text(
                        'IMDB ID: ' + movies[index].imdbId,
                        style: TextStyle(fontSize: 12, color: Colors.green),
                      )
                    ],
                  ),
                ))
              ],
            ),
          );
        });
  }
}
