import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.freezed.dart';
part 'story.g.dart';

@freezed
class Story with _$Story {
  const factory Story({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'isViewed') bool? isViewed,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
