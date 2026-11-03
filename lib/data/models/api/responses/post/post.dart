import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_comment/user_comment.dart';
import '../user_like_post/user_like_post.dart';
import '../user_share/user_share.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
    @JsonKey(name: 'caption') String? caption,
    @JsonKey(name: 'createdPost') String? createdPost,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'videoUrl') String? videoUrl,
    @JsonKey(name: 'listUserLikedPost') List<UserLikePost>? listUserLikedPost,
    @JsonKey(name: 'listUserCommented') List<UserComment>? listUserCommented,
    @JsonKey(name: 'listUserShared') List<UserShare>? listUserShared,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
