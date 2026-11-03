import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_feedback/user_feedback.dart';
import '../user_like_comment/user_like_comment.dart';

part 'user_comment.freezed.dart';
part 'user_comment.g.dart';

@freezed
class UserComment with _$UserComment {
  const factory UserComment({
    @JsonKey(name: 'userNameCommented') String? userNameCommented,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'comment') String? comment,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'listUserLikedComment')
    List<UserLikeComment>? listUserLikedComment,
    @JsonKey(name: 'listUserFeedBacks') List<UserFeedback>? listUserFeedBacks,
  }) = _UserComment;

  factory UserComment.fromJson(Map<String, dynamic> json) =>
      _$UserCommentFromJson(json);
}
