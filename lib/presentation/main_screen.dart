import 'package:data_layer_example/data/repository/movie_repository.dart';
import 'package:data_layer_example/models/movie.dart';
import 'package:data_layer_example/presentation/movie_overview.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Layer Example'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: Provider.of<MovieRepository>(context).getMovies(),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];

                return ListTile(
                  leading: SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: ClipOval(
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w200/${movie.posterPath}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: Text(movie.title),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieOverview(movie: movie),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: snapshot.data!.length,
            );
          } else if (snapshot.hasError) {
            Provider.of<Logger>(context)
                .e('Error while fetching data: ${snapshot.error.toString()}');
            return const Center(
              child: Text(
                'An error occurred while fetching data.',
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
