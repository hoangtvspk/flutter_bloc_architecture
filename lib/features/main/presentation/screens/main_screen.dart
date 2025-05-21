import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../business_logic/main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final GoRouter _router;
  late final VoidCallback _listener;

  final List<Widget> _screens = [
    const HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _router = GoRouter.of(context);

    // Add route change listener
    _listener = () {
      final uri = _router.routerDelegate.currentConfiguration.uri;
      final queryParams = uri.queryParameters;
      final tab = queryParams['tab'];

      context.read<MainBloc>().add(MainDeepLinkReceived(tab: tab));
    };
    _router.routerDelegate.addListener(_listener);

    // Initial deep link handling
    final uri = _router.routerDelegate.currentConfiguration.uri;
    final queryParams = uri.queryParameters;
    final tab = queryParams['tab'];
    context.read<MainBloc>().add(MainDeepLinkReceived(tab: tab));
  }

  @override
  void dispose() {
    _router.routerDelegate.removeListener(_listener);
    super.dispose();
  }

  void _onItemTapped(int index) {
    context.read<MainBloc>().add(const MainTabChanged(index: 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: _screens[state.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: Colors.grey,
            currentIndex: state.selectedIndex,
            onTap: _onItemTapped,
            iconSize: 22,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.house),
                label: context.l10n.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.search),
                label: context.l10n.search,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.music_albums),
                label: context.l10n.library,
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.settings),
                label: context.l10n.settings,
              ),
            ],
          ),
        );
      },
    );
  }
}
