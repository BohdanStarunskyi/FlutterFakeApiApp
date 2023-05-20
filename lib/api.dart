import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:test_app/comment_service.dart';
import 'models/comment_model.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET("/comments")
  Future<List<Comment>> getComments();
}

class _RestClient implements RestClient {
  final Dio _dio;
  _RestClient(this._dio);

  @override
  Future<List<Comment>> getComments() async {
    dio.options.baseUrl = 'https://jsonplaceholder.typicode.com/';
    dio.options.connectTimeout = 150000;
    final response = await _dio.get('comments');
    final List<dynamic> jsonList = response.data;
    final List<Comment> comments =
        jsonList.map((json) => Comment.fromJson(json)).toList();
    return comments;
  }
}
