import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/api/responses/post/post.dart';
import '../../models/api/responses/story/story.dart';
import '../common/common_state.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Story> storyList,
    @Default([]) List<Post> postList,
    @Default(StateLoading.start) isLoading,
  }) = _HomeState;

  const HomeState._();
}
