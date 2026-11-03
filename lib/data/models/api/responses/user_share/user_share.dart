import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_share.freezed.dart';
part 'user_share.g.dart';

@freezed
class UserShare with _$UserShare {
  const factory UserShare({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'sharedAt') String? sharedAt,
  }) = _UserShare;

  factory UserShare.fromJson(Map<String, dynamic> json) =>
      _$UserShareFromJson(json);
}
