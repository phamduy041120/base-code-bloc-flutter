import '../../../models/api/responses/story/story.dart';
import '../../../services/api/api.dart';
import '../../../services/api/story/api_story_client.dart';

class StoryRepository {
  final _apiStoryClient = ApiStoryClient(Api.dio);

  Future<List<Story>> getStory(
    Function(List<Story>) saveStoryListForSession,
    Function(List<Story>) writeStoryListForSecureStorage,
  ) async {
    final storyResponse = await _apiStoryClient.getStory();
    saveStoryListForSession(storyResponse);
    writeStoryListForSecureStorage(storyResponse);
    return storyResponse;
  }
}

final storyRepository = StoryRepository();
