import 'package:bloc_architecture/core/models/base_response/base_response.dart';
import 'package:bloc_architecture/core/network/dio_client.dart';
import 'package:bloc_architecture/core/storage/secure_storage.dart';
import 'package:bloc_architecture/features/auth/data/models/login_request.dart';
import 'package:bloc_architecture/features/auth/data/models/login_response.dart';
import 'package:bloc_architecture/features/auth/data/models/user.dart';
import '../services/auth_service.dart';

class AuthRepository {
  AuthRepository();

  final AuthService authService = AuthService();
  Future<BaseResponse<LoginResponse>> login(
      {required LoginRequest request}) async {
    try {
      // replace with api call when backend is ready

      const data = LoginResponse(
        accessToken: 'accessToken',
        refreshToken: 'refreshToken',
      );

      // final res = await authService.login(request: request);
      // if (res == null) {
      //   throw Exception("Login Failed");
      // }
      // final data = LoginResponse.fromJson(res);
      await SecureStorage().writeAccessToken(data.accessToken);
      await SecureStorage().writeRefreshToken(data.refreshToken);
      print("Login Success");
      return const BaseResponse(success: true, data: data);
    } catch (e) {
      print("Login Failed $e");
      throw Exception("Login Failed $e");
    }
  }

  Future<BaseResponse<void>> logout() async {
    try {
      await authService.logout();
      return const BaseResponse(success: true);
    } catch (e) {
      throw Exception("Logout Failed $e");
    }
  }

  Future<BaseResponse<User>> getUser() async {
    try {
      // final res = await authService.getUserProfile();
      const data = User(
        id: '1',
        name: 'John Doe',
        email: 'john.doe@example.com',
        image: 'https://example.com/avatar.png',
        country: 'United States',
        product: 'Premium',
      );
      print("Get User Success");
      return const BaseResponse(success: true, data: data);
    } catch (e) {
      print("Get User Failed $e");
      throw Exception("Get User Failed $e");
    }
  }

  Future<BaseResponse<void>> refreshToken() async {
    final dioClient = DioClient();
    final refreshToken = await SecureStorage().readRefreshToken();
    dioClient.resetTokens();

    if (refreshToken == null) {
      throw Exception('No refresh token available');
    }
    try {
      final res = await authService.refreshToken(refreshToken);
      if (res == null) {
        throw Exception("Refresh Token Failed");
      }
      final data = LoginResponse.fromJson(res);
      await dioClient.setTokens(
        accessToken: data.accessToken,
        refreshToken: data.refreshToken,
      );
      return const BaseResponse(success: true);
    } catch (e) {
      throw Exception("Refresh Token Failed $e");
    }
  }
}
