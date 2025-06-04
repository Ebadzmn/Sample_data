import 'package:flutter/material.dart';
import 'package:sampledata/Movie/data/movie_data_model.dart';

class MovieDescription extends StatefulWidget {
  final Movie movie;
  const MovieDescription({super.key , required this.movie});

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  late Movie movie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movie = widget.movie;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.category),
      ),
      body: Column(
        children: [
          Text(movie.name),
          SizedBox(height: 20,),
          Text(movie.description),
        ],
      ),
    );
  }
}
