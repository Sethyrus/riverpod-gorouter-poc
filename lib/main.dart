import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod101/models/user_profile.dart';
import 'package:riverpod101/screens/home_screen.dart';
import 'package:riverpod101/screens/login_screen.dart';
import 'package:riverpod101/screens/register_screen.dart';
import 'package:riverpod101/services/auth_service.dart';
import 'package:riverpod101/utils/consts.dart';

class _App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserProfile?> userProfile = ref.watch(authProvider);

    return MaterialApp.router(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primary,
          secondary: primary,
        ),
        canvasColor: Colors.white,
      ),
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: HomeScreen.routeName,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: LoginScreen.routeName,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: RegisterScreen.routeName,
            builder: (context, state) => const RegisterScreen(),
          ),
        ],
        redirect: (BuildContext context, GoRouterState state) {
          final loggedIn = userProfile.value != null;
          final loggingIn = state.matchedLocation == LoginScreen.routeName ||
              state.matchedLocation == RegisterScreen.routeName;

          if (!loggedIn) return loggingIn ? null : '/login';

          if (loggingIn) return '/';

          return null;
        },
      ),
    );
  }
}

void main() {
  runApp(ProviderScope(child: _App()));
}
