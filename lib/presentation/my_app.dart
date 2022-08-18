import 'package:data_layer_example/data.dart';
import 'package:data_layer_example/data/database/dao/movie_dao.dart';
import 'package:data_layer_example/data/mapper.dart';
import 'package:data_layer_example/data/network/client/api_client.dart';
import 'package:data_layer_example/data/repository/movie_repository.dart';
import 'package:data_layer_example/presentation/main_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Logger>(
          create: (_) => Logger(
            printer: PrettyPrinter(),
            level: kDebugMode ? Level.verbose : Level.nothing,
          ),
        ),
        Provider<MovieRepository>(
          create: (_) => MovieRepository(
            apiClient:
                ApiClient(baseUrl: 'api.themoviedb.org/3', apiKey: apiKey),
            mapper: Mapper(),
            movieDao: MovieDao(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
