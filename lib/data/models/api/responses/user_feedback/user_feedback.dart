import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_like_feedback/user_like_feedback.dart';

part 'user_feedback.freezed.dart';
part 'user_feedback.g.dart';

@freezed
class UserFeedback with _$UserFeedback {
  const factory UserFeedback({
    @JsonKey(name: 'userName') String? userName,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'comment') String? comment,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'listUserLikedFeedBacks')
    List<UserLikeFeedback>? listUserLikedFeedBacks,
  }) = _UserFeedback;

  factory UserFeedback.fromJson(Map<String, dynamic> json) =>
      _$UserFeedbackFromJson(json);
}
