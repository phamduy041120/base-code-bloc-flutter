import '../../../models/api/responses/post/post.dart';
import '../../../models/api/responses/story/story.dart';

class SessionRepository {
  List<Story>? _storyList;

  List<Post>? _postList;

  List<Story>? storyList() {
    return _storyList;
  }

  void saveStoryList(List<Story>? storyList) {
    _storyList = storyList;
  }

  List<Post>? postList() {
    return _postList;
  }

  void savePostList(List<Post>? postList) {
    _postList = postList;
  }
}

final sessionRepository = SessionRepository();
