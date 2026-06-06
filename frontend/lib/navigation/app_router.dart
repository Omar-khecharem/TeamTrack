import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth_notifier.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/register_screen.dart';
import '../features/auth/screens/forgot_password_screen.dart';
import '../features/dashboard/screens/dashboard_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/profile/screens/edit_profile_screen.dart';
import 'shell_scaffold.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  refreshListenable: AuthNotifier.instance,
  redirect: _authGuard,
  routes: [
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => _fadePage(const LoginScreen(), state),
    ),
    GoRoute(
      path: '/register',
      pageBuilder: (context, state) => _fadePage(const RegisterScreen(), state),
    ),
    GoRoute(
      path: '/forgot-password',
      pageBuilder: (context, state) => _fadePage(const ForgotPasswordScreen(), state),
    ),
    GoRoute(
      path: '/profile/edit',
      pageBuilder: (context, state) => _fadePage(const EditProfileScreen(), state),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNavBar(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/dashboard',
              pageBuilder: (context, state) =>
                  _fadePage(const DashboardScreen(), state),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) =>
                  _fadePage(const ProfileScreen(), state),
            ),
          ],
        ),
      ],
    ),
  ],
);

CustomTransitionPage _fadePage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 250),
  );
}

String? _authGuard(BuildContext context, GoRouterState state) {
  final auth = AuthNotifier.instance;
  if (!auth.initialized) return null;

  final isLoggedIn = auth.isAuthenticated;
  final location = state.matchedLocation;

  final isAuthRoute = switch (location) {
    '/login' || '/register' || '/forgot-password' => true,
    _ => false,
  };

  if (isLoggedIn && isAuthRoute) return '/dashboard';
  if (!isLoggedIn && !isAuthRoute) return '/login';
  return null;
}
