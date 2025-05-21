import 'package:bloc_architecture/core/config/app_color.dart';
import 'package:bloc_architecture/core/models/status/status.dart';
import 'package:bloc_architecture/core/utils/snackbar_utils.dart';
import 'package:bloc_architecture/core/widgets/button/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../business_logic/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: AppColor.gray,
        ),
        child: Stack(
          children: [
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                state.authStatus.maybeWhen(
                  success: () {
                    SnackbarUtils.showSnackbar(
                      context: context,
                      message: 'Welcome',
                    );
                    context.read<AuthBloc>().add(const GetUserInfoEvent());
                    context.go('/main?tab=home');
                  },
                  failure: (message) {
                    SnackbarUtils.showSnackbar(
                      context: context,
                      message: message,
                      isError: true,
                    );
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 20,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: AppButton(
                        text: 'Login',
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                AuthEvent.login(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                        },
                        isLoading: state.authStatus == const Status.loading(),
                        isFullWidth: true,
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
