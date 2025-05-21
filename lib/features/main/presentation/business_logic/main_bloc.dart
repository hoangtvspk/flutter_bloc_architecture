import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_bloc.freezed.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainTabChanged>(_onTabChanged);
    on<MainDeepLinkReceived>(_onDeepLinkReceived);
  }

  void _onTabChanged(MainTabChanged event, Emitter<MainState> emit) {
    emit(state.copyWith(
      selectedIndex: event.index,
      currentTab: event.tab,
    ));
  }

  void _onDeepLinkReceived(
      MainDeepLinkReceived event, Emitter<MainState> emit) {
    final tab = event.tab;
    if (tab == null) return;

    final index = switch (tab) {
      'home' => 0,
      'search' => 1,
      'library' => 2,
      'settings' => 3,
      _ => 0,
    };

    emit(state.copyWith(
      selectedIndex: index,
      currentTab: tab,
    ));
  }
}
