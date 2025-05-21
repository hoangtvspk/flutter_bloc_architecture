import 'package:bloc_architecture/core/constants/api_endpoints.dart';
import 'package:bloc_architecture/core/services/dio_service.dart';
import 'package:bloc_architecture/core/storage/secure_storage.dart';
import 'package:bloc_architecture/features/auth/data/models/login_request.dart';
import 'package:dio/dio.dart';

class AuthService with DioService {
  Future<dynamic> login({required LoginRequest request}) async {
    try {
      final result = await dioClient.post(
        ApiEndpoints.login,
        data: request.toJson(),
      );
      return result.data;
    } catch (e) {
      throw Exception('Failed to sign in : $e');
    }
  }

  Future<dynamic> getUserProfile() async {
    try {
      final response = await dioClient.get(ApiEndpoints.me);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await SecureStorage().deleteAccessToken();
      await SecureStorage().deleteRefreshToken();
    } catch (e) {
      throw Exception("Logout failed");
    }
  }

  Future<dynamic> refreshToken(String refreshToken) async {
    try {
      final response = await dioClient.post(
        ApiEndpoints.refreshToken,
        queryParameters: {
          'refresh_token': refreshToken,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to refresh token: $e');
    }
  }
}
