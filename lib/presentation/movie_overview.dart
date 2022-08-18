import 'package:data_layer_example/models/movie.dart';
import 'package:flutter/material.dart';

class MovieOverview extends StatelessWidget {
  final Movie movie;

  const MovieOverview({Key? key, required this.movie}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 24.0,
            right: 16.0,
            bottom: 24.0,
          ),
          child: Text(
            movie.overview,
          ),
        ),
      ),
    );
  }
}
