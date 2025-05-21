import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../config/app_color.dart';
import '../../features/auth/business_logic/auth_bloc.dart';

class UiUtils {
  static Future<void> showLogoutConfirmation(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColor.gray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: AppColor.primary),
          ),
          title: const Text(
            'Confirm Logout',
            style: TextStyle(
              color: AppColor.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Are you sure you want to logout?',
            style: TextStyle(
              color: AppColor.textSecondary,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: AppColor.textSecondary,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Logout',
                style: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                context.read<AuthBloc>().add(const AuthEvent.logout());
                context.push('/login');
              },
            ),
          ],
        );
      },
    );
  }
}
