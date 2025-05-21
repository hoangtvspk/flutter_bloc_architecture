part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isAuthenticated,
    @Default(null) User? user,
    @Default(Status.idle()) Status authStatus,
    @Default(Status.idle()) Status userStatus,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState();
}
