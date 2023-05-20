import 'package:dio/dio.dart';
import 'models/comment_model.dart';
import 'api.dart';

final dio = Dio(); // Create a Dio instance
final restClient = RestClient(dio); // Create an instance of the RestClient
Future<List<Comment>> fetchComments() async {
  return restClient.getComments();
}
