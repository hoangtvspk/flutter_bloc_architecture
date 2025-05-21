import 'package:bloc_architecture/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/utils/ui_utils.dart';
import '../../../auth/business_logic/auth_bloc.dart';
import '../../../main/presentation/business_logic/main_bloc.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.gray,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 60.0, right: 20, left: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset(
            //   'assets/images/app_icon.png',
            //   width: 40,
            // ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                print("State: $state");
                return Row(
                  children: [
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user?.name ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          context.l10n.viewProfile,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),

            const Divider(
              color: Colors.white24,
              height: 40,
            ),
            // Navigation Items
            Expanded(
              child: BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildNavItem(
                            context,
                            icon: Icons.home,
                            label: context.l10n.home,
                            onTap: () {
                              context
                                  .read<MainBloc>()
                                  .add(const MainTabChanged(index: 0));
                              Navigator.pop(
                                  context); // Close drawer after navigation
                            },
                          ),
                          _buildNavItem(
                            context,
                            icon: Icons.search,
                            label: context.l10n.search,
                            onTap: () {
                              context
                                  .read<MainBloc>()
                                  .add(const MainTabChanged(index: 1));
                              Navigator.pop(context);
                            },
                          ),
                          _buildNavItem(
                            context,
                            icon: Icons.library_music,
                            label: context.l10n.library,
                            onTap: () {
                              context
                                  .read<MainBloc>()
                                  .add(const MainTabChanged(index: 2));
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          children: [
                            const Divider(color: Colors.white24),
                            const SizedBox(height: 16),
                            _buildNavItem(
                              context,
                              icon: Icons.settings,
                              label: context.l10n.settings,
                              onTap: () {
                                context
                                    .read<MainBloc>()
                                    .add(const MainTabChanged(index: 3));
                                Navigator.pop(context);
                              },
                            ),
                            _buildNavItem(
                              context,
                              icon: Icons.logout,
                              label: context.l10n.logout,
                              onTap: () {
                                Navigator.pop(context);
                                UiUtils.showLogoutConfirmation(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: Icon(icon, color: Colors.white),
      title: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}
