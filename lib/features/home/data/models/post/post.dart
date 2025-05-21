import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@Freezed(genericArgumentFactories: true)
class Post with _$Post {
  const factory Post({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String body,
  }) = _Post;

  factory Post.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PostFromJson(json);
}
