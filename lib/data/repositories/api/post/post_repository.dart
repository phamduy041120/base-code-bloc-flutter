import '../../../models/api/responses/post/post.dart';
import '../../../services/api/api.dart';
import '../../../services/api/post/api_post_client.dart';

class PostRepository {
  final _apiPostClient = ApiPostClient(Api.dio);

  Future<List<Post>> getPost(
    Function(List<Post> postList) savePostListForSession,
    Function(List<Post> postList) writePostListForSecureStorage,
  ) async {
    final postResponse = await _apiPostClient.getPost();
    savePostListForSession(postResponse);
    writePostListForSecureStorage(postResponse);
    return postResponse;
  }
}

final postRepository = PostRepository();
