import 'package:flutter/material.dart';
import 'package:sampledata/Movie/data/movie_data.dart';
import 'package:sampledata/Movie/data/movie_data_model.dart';
import 'package:sampledata/Movie/ui/movie_description.dart';

class MovieScreen extends StatefulWidget {
   MovieScreen({super.key});
  final List<Movie> movies = staticMovies.map((map) => Movie.fromMap(map)).toList();

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Data'),
      ),
      body: ListView.builder( itemCount: widget.movies.length,itemBuilder: (context,index) {
        final movie = widget.movies[index];

        return Card(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDescription(movie: movie)));
            },
            child: ListTile(
              title: Text(movie.name),
              subtitle: Text(movie.description),
            ),
          ),
        );
      }),
    );
  }
}
