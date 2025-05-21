part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(0) int selectedIndex,
    String? currentTab,
  }) = _MainState;
}
