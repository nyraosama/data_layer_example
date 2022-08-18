import 'package:data_layer_example/data/network/entity/movie_entity.dart';
import 'package:dio/dio.dart';

class CustomException implements Exception {
  final int statusCode;
  final String? message;

  const CustomException({required this.statusCode, this.message});

  @override
  String toString() =>
      'CustomException: $statusCode, message: ${message ?? 'No Message Specified'}';
}

class ApiClient {
  final String baseUrl;
  final String apiKey;

  ApiClient({required this.baseUrl, required this.apiKey});

  Future<MovieListResponse> getMovies() async {
    try {
      final response=await Dio().get(
        'https://$baseUrl/discover/movie',
        queryParameters: {
          'api_key': apiKey,
          'from':0,
          'size':20,
        },
      );

      //simulate more network delay
      await Future.delayed(const Duration(seconds: 5));

      if(response.data!= null){
        final data=response.data;
        return MovieListResponse.fromJson(data as Map<String,dynamic>);
      }
      else{
        throw Exception('could not parse response.');
      }
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        throw CustomException(
          statusCode: e.response!.statusCode!,
          message: e.response!.data.toString(),
        );
      }
      else{
        throw Exception(e.message);
      }
    }
  }
}
