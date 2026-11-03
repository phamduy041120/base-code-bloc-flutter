import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_like_feedback.freezed.dart';
part 'user_like_feedback.g.dart';

@freezed
class UserLikeFeedback with _$UserLikeFeedback {
  const factory UserLikeFeedback({
    @JsonKey(name: 'userNameLiked') String? userNameLiked,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
  }) = _UserLikeFeedback;

  factory UserLikeFeedback.fromJson(Map<String, dynamic> json) =>
      _$UserLikeFeedbackFromJson(json);
}
