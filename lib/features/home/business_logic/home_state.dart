part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Post> posts,
    @Default(Status.idle()) Status statusLoadPosts,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState();
}
