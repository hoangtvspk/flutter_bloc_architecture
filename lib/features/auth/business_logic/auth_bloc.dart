import 'package:bloc_architecture/core/models/status/status.dart';
import 'package:bloc_architecture/core/network/api_caller.dart';
import 'package:bloc_architecture/features/auth/data/models/login_request.dart';
import 'package:bloc_architecture/features/auth/data/models/user.dart';
import 'package:bloc_architecture/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with ApiCaller {
  final AuthRepository authRepository = AuthRepository();
  AuthBloc() : super(AuthState.initial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<GetUserInfoEvent>(_onGetUserInfo);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStatus: const Status.loading()));

    await apiCallSafety(
      () => authRepository.login(
          request: LoginRequest(email: event.email, password: event.password)),
      onStart: () async =>
          emit(state.copyWith(authStatus: const Status.loading())),
      onSuccess: (data) async => emit(state.copyWith(
          authStatus: const Status.success(), isAuthenticated: true)),
      onError: (error) async {
        print("Login Failed $error");
        emit(state.copyWith(authStatus: Status.failure(error.toString())));
      },
      onCompleted: () async =>
          emit(state.copyWith(authStatus: const Status.idle())),
      onFinally: () async =>
          emit(state.copyWith(authStatus: const Status.idle())),
    );
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await authRepository.logout();
    emit(state.copyWith(authStatus: const Status.idle()));
  }

  Future<void> _onGetUserInfo(
      GetUserInfoEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(userStatus: const Status.loading()));

    await apiCallSafety(
      () => authRepository.getUser(),
      onStart: () async =>
          emit(state.copyWith(userStatus: const Status.loading())),
      onSuccess: (data) async => {
        print("Get User Success $data"),
        emit(state.copyWith(userStatus: const Status.success(), user: data))
      },
      onError: (error) async =>
          emit(state.copyWith(userStatus: Status.failure(error.toString()))),
      onCompleted: () async =>
          emit(state.copyWith(userStatus: const Status.idle())),
      onFinally: () async =>
          emit(state.copyWith(userStatus: const Status.idle())),
    );
  }
}
