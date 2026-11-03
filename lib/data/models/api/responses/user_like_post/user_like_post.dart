import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_like_post.freezed.dart';
part 'user_like_post.g.dart';

@freezed
class UserLikePost with _$UserLikePost {
  const factory UserLikePost({
    @JsonKey(name: 'userNameLiked') String? userNameLiked,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
  }) = _UserLikePost;

  factory UserLikePost.fromJson(Map<String, dynamic> json) =>
      _$UserLikePostFromJson(json);
}
