import 'package:bloc_architecture/features/auth/presentation/screens/login_screen.dart';
import 'package:bloc_architecture/features/main/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

import '../network/dio_client.dart';
import '../storage/secure_storage.dart';

GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/main',
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: ${state.error}'),
    ),
  ),
  redirect: (BuildContext context, GoRouterState state) async {
    final token = await SecureStorage().readAccessToken();
    FlutterNativeSplash.remove();

    final isAuth = token != null;
    if (!isAuth) return '/login';

    // Handle deep links with custom scheme
    if (state.uri.scheme == 'buibloc') {
      final queryParams = state.uri.queryParameters;

      // Handle tab query parameter
      if (queryParams.containsKey('tab')) {
        final tab = queryParams['tab'];
        debugPrint('Tab parameter: $tab');
        return '/main?tab=$tab';
      }

      return '/main';
    }

    if (isAuth && state.path == '/') {
      return '/main';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => const MainScreen(),
    ),
  ],
);
