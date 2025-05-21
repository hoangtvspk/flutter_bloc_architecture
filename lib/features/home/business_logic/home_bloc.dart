import 'package:bloc_architecture/core/models/status/status.dart';
import 'package:bloc_architecture/core/network/api_caller.dart';
import 'package:bloc_architecture/features/home/data/models/post/post.dart';
import 'package:bloc_architecture/features/home/data/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/services/home_service.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with ApiCaller {
  final HomeService homeService = HomeService();
  late HomeRepository repo;

  HomeBloc() : super(HomeState.initial()) {
    repo = HomeRepository(homeService);
    on<_Started>(_onStarted);
    on<_GetPosts>(_onGetPosts);
  }

  Future<void> _onStarted(_Started event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      statusLoadPosts: const Status.loading(),
    ));
    add(const _GetPosts());
  }

  void start() {
    add(const _Started());
  }

  Future<void> _onGetPosts(_GetPosts event, Emitter<HomeState> emit) async {
    emit(state.copyWith(statusLoadPosts: const Status.loading()));

    await apiCallSafety(
      () => repo.getPosts(),
      onStart: () async =>
          emit(state.copyWith(statusLoadPosts: const Status.loading())),
      onSuccess: (data) async => emit(state.copyWith(
        posts: data ?? [],
        statusLoadPosts: const Status.success(),
      )),
      onError: (error) async => emit(state.copyWith(
        statusLoadPosts: Status.failure(error.toString()),
      )),
      onCompleted: () async =>
          emit(state.copyWith(statusLoadPosts: const Status.idle())),
      onFinally: () async =>
          emit(state.copyWith(statusLoadPosts: const Status.idle())),
    );
  }
}
