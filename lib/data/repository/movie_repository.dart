import 'package:data_layer_example/data/database/dao/movie_dao.dart';
import 'package:data_layer_example/data/mapper.dart';
import 'package:data_layer_example/data/network/client/api_client.dart';
import 'package:data_layer_example/models/movie.dart';

class MovieRepository {
  final ApiClient apiClient;
  final Mapper mapper;
  final MovieDao movieDao;

  MovieRepository({
    required this.apiClient,
    required this.mapper,
    required this.movieDao,
  });

  Future<List<Movie>> getMovies() async {
    //fetch the movies from database
    final dbEntities=await movieDao.selectAll();

    if(dbEntities.isNotEmpty){
      return mapper.toMoviesFromDb(dbEntities);
    }

    //if the database is empty, fetch from the API, save it to the database,
    // and return it to the caller.
    final response = await apiClient.getMovies();
    final movies=mapper.toMovies(response.results);

    await movieDao.insertAll(mapper.toMoviesDbEntity(movies));

    return movies;
  }
}
