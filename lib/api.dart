import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
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
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/comments');
    final List<dynamic> jsonList = response.data;
    final List<Comment> comments =
        jsonList.map((json) => Comment.fromJson(json)).toList();
    return comments;
  }
}
