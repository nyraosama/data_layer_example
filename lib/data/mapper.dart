import 'package:data_layer_example/data/database/entity/movie_db_entity.dart';
import 'package:data_layer_example/data/network/entity/movie_entity.dart';
import 'package:data_layer_example/models/movie.dart';

class MapperException<From, To> implements Exception {
  final String message;

  const MapperException(this.message);

  @override
  String toString() => 'Error when mapping class $From to $To: $message';
}

class Mapper {
  Movie toMovie(MovieEntity entity) {
    try {
      return Movie(
        id: entity.id,
        title: entity.title,
        posterPath: entity.posterPath,
        overview: entity.overview,
      );
    } catch (e) {
      throw MapperException<MovieEntity, Movie>(e.toString());
    }
  }

  List<Movie> toMovies(List<MovieEntity> entities) {
    final List<Movie> movies = [];
    for (final entity in entities) {
      movies.add(toMovie(entity));
    }
    return movies;
  }

  Movie toMovieFromDb(MovieDbEntity entity) {
    try {
      return Movie(
          id: entity.id,
          title: entity.title,
          posterPath: entity.posterPath,
          overview: entity.overview);
    } catch (e) {
      throw MapperException<MovieDbEntity, Movie>(e.toString());
    }
  }

  List<Movie> toMoviesFromDb(List<MovieDbEntity> entities) {
    final List<Movie> movies = [];

    for (final entity in entities) {
      movies.add(toMovieFromDb(entity));
    }
    return movies;
  }

  MovieDbEntity toMovieDbEntity(Movie movie) {
    try {
      return MovieDbEntity(
          id: movie.id,
          title: movie.title,
          posterPath: movie.posterPath,
          overview: movie.overview,
      );
    } catch (e) {
      throw MapperException<Movie, MovieDbEntity>(e.toString());
    }
  }

  List<MovieDbEntity> toMoviesDbEntity(List<Movie> entities) {
    final List<MovieDbEntity> list = [];

    for (final entity in entities) {
      list.add(toMovieDbEntity(entity));
    }
    return list;
  }
}
