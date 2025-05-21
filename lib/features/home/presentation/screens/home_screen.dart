import 'package:bloc_architecture/core/storage/secure_storage.dart';
import 'package:bloc_architecture/features/home/presentation/widgets/home_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/app_color.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../business_logic/home_bloc.dart';
import '../widgets/sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String token = '';
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();

    // Initialize HomeBloc
    _homeBloc = HomeBloc()..add(const HomeEvent.started());
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  void setToken() async {
    final storageToken = await SecureStorage().readAccessToken();
    setState(() {
      token = storageToken ?? 'No token';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grayLight,
      drawer: const Sidebar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.5, 1.0],
            colors: [
              Colors.black.withValues(alpha: 0.2),
              Colors.black.withValues(alpha: 0.3),
              Colors.black.withValues(alpha: 0.9),
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.transparent,
                floating: true,
                leadingWidth: 30,
                centerTitle: false,
                title: Text('Home'),
              ),
              SliverToBoxAdapter(
                child: BlocProvider(
                  create: (context) => _homeBloc,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Column(
                        spacing: 24,
                        children: [
                          // New Releases Section
                          state.statusLoadPosts.maybeWhen(
                            idle: () => HomeSkeleton(
                              title: context.l10n.newRelease,
                              key: const ValueKey('idle_posts'),
                            ),
                            loading: () => HomeSkeleton(
                              title: context.l10n.newRelease,
                              key: const ValueKey('loading_posts'),
                            ),
                            failure: (message) => const SizedBox.shrink(),
                            orElse: () => state.posts.isNotEmpty
                                ? SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                        return Text(state.posts[index].title);
                                      },
                                      childCount: state.posts.length,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
