part of 'main_bloc.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.tabChanged({
    required int index,
    String? tab,
  }) = MainTabChanged;

  const factory MainEvent.deepLinkReceived({
    String? tab,
  }) = MainDeepLinkReceived;
}
