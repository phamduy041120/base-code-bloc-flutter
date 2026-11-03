import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../models/api/responses/story/story.dart';

part 'api_story_client.g.dart';

@RestApi(baseUrl: 'https://jsonblob.com/api/jsonBlob/1270761262534221824/')
abstract class ApiStoryClient {
  factory ApiStoryClient(Dio dio, {String baseUrl}) = _ApiStoryClient;

  @GET('/json')
  Future<List<Story>> getStory();
}
