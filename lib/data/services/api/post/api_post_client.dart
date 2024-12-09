import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../models/api/responses/post/post.dart';

part 'api_post_client.g.dart';

@RestApi(baseUrl: 'https://jsonblob.com/api/jsonBlob/1270760968270241792/')
abstract class ApiPostClient {
  factory ApiPostClient(Dio dio, {String baseUrl}) = _ApiPostClient;

  @GET('/json')
  Future<List<Post>> getPost();
}
