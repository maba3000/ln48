import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ln48/app/game_registry.dart';
import 'package:ln48/app/home_page.dart';
import 'package:ln48/features/settings/settings_page.dart';
import 'package:ln48/l10n/app_localizations.dart';

part 'app_router.g.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final routerNeglect = kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
  return GoRouter(
    routes: $appRoutes,
    routerNeglect: routerNeglect,
  );
});

void goToGame(BuildContext context, String id) {
  context.push('/game/$id');
}

void goToSettings(BuildContext context) {
  context.push('/settings');
}

// Helper function for smooth page transitions
Page<void> _buildPageWithTransition(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Fade transition to avoid flash
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
    reverseTransitionDuration: const Duration(milliseconds: 200),
  );
}

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context,
      state,
      const HomePage(),
    );
  }
}

@TypedGoRoute<GameRoute>(
  path: '/game/:id',
)
class GameRoute extends GoRouteData {
  const GameRoute(this.id);

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final container = ProviderScope.containerOf(context);
    final feature = container.read(gameByIdProvider(id));
    if (feature == null) {
      final l10n = AppLocalizations.of(context)!;
      return Scaffold(
        appBar: AppBar(leading: const BackButton()),
        body: Center(child: Text(l10n.gameNotFound)),
      );
    }
    return feature.buildPage(context);
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context,
      state,
      build(context, state),
    );
  }
}

@TypedGoRoute<SettingsRoute>(
  path: '/settings',
)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return _buildPageWithTransition(
      context,
      state,
      const SettingsPage(),
    );
  }
}
