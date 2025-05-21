part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  // Initialization
  const factory HomeEvent.started() = _Started;

  // New Releases
  const factory HomeEvent.getPosts() = _GetPosts;
}
