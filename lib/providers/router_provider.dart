import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod101/utils/toast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod101/models/user_profile.dart';
import 'package:riverpod101/providers/auth_provider.dart';
import 'package:riverpod101/screens/home_screen.dart';
import 'package:riverpod101/screens/login_screen.dart';
import 'package:riverpod101/screens/register_screen.dart';
import 'package:riverpod101/screens/screen_1.dart';
import 'package:riverpod101/screens/screen_2a.dart';
import 'package:riverpod101/screens/screen_2a1.dart';
import 'package:riverpod101/screens/screen_2a2.dart';
import 'package:riverpod101/screens/screen_2b.dart';
import 'package:riverpod101/screens/screen_2c.dart';
import 'package:riverpod101/screens/screen_2c1.dart';
import 'package:riverpod101/screens/screen_2c2.dart';
import 'package:riverpod101/screens/screen_2c3.dart';
import 'package:riverpod101/screens/screen_3a.dart';
import 'package:riverpod101/screens/screen_3b.dart';
import 'package:riverpod101/widgets/drawer_layout.dart';
import 'package:riverpod101/widgets/tabs_layout.dart';

part 'router_provider.g.dart';

// Global keys for each navigator
// Supposedly can cause unexpected behavior if not used
// Also can be used to access the navigator state from anywhere in the app
final _rootNavKey = GlobalKey<NavigatorState>();
final _homeNavKey = GlobalKey<NavigatorState>();
final _screen1NavKey = GlobalKey<NavigatorState>();
final _screen2NavKey = GlobalKey<NavigatorState>();
final _screen2aNavKey = GlobalKey<NavigatorState>();
final _screen2bNavKey = GlobalKey<NavigatorState>();
final _screen2cNavKey = GlobalKey<NavigatorState>();
final _screen3NavKey = GlobalKey<NavigatorState>();
final _screen3aNavKey = GlobalKey<NavigatorState>();
final _screen3bNavKey = GlobalKey<NavigatorState>();

/// Router Provider
/// Manages routing logic, including authentication flow by listening to
/// the authProvider
@riverpod
GoRouter router(RouterRef ref) {
  final AsyncValue<UserProfile?> userProfile = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _rootNavKey,
    initialLocation: HomeScreen.routeName,
    routes: [
      // Login page
      GoRoute(
        path: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
      // Register page
      GoRoute(
        path: RegisterScreen.routeName,
        builder: (context, state) => const RegisterScreen(),
      ),
      // Main navigation stack (Drawer)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DrawerLayout(navigationShell: navigationShell);
        },
        branches: [
          // Home branch
          StatefulShellBranch(
            navigatorKey: _homeNavKey,
            initialLocation: HomeScreen.routeName,
            routes: [
              GoRoute(
                path: HomeScreen.routeName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          // Screen 1 branch
          StatefulShellBranch(
            navigatorKey: _screen1NavKey,
            initialLocation: Screen1.routeName,
            routes: [
              GoRoute(
                path: Screen1.routeName,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Screen1(),
                ),
              ),
            ],
          ),
          // Screen 2 branch (Tabs)
          StatefulShellBranch(
            navigatorKey: _screen2NavKey,
            initialLocation: Screen2a.routeName,
            routes: [
              StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) {
                  return TabsLayout(
                    navigationShell: navigationShell,
                    tabs: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.candlestick_chart),
                        label: 'Candlestick',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.call),
                        label: 'Call',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.chair_rounded),
                        label: 'Chair',
                      ),
                    ],
                  );
                },
                branches: [
                  StatefulShellBranch(
                    navigatorKey: _screen2aNavKey,
                    initialLocation: Screen2a.routeName,
                    routes: [
                      GoRoute(
                        path: Screen2a.routeName,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: Screen2a(),
                        ),
                        routes: [
                          GoRoute(
                            path: Screen2a1.routeName,
                            builder: (context, state) => const Screen2a1(),
                          ),
                          GoRoute(
                            path: Screen2a2.routeName,
                            builder: (context, state) => const Screen2a2(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: _screen2bNavKey,
                    initialLocation: Screen2b.routeName,
                    routes: [
                      GoRoute(
                        path: Screen2b.routeName,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: Screen2b(),
                        ),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: _screen2cNavKey,
                    initialLocation: Screen2c.routeName,
                    routes: [
                      GoRoute(
                        path: Screen2c.routeName,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: Screen2c(),
                        ),
                        routes: [
                          GoRoute(
                            path: Screen2c1.routeName,
                            builder: (context, state) => const Screen2c1(),
                          ),
                          GoRoute(
                            path: Screen2c2.routeName,
                            builder: (context, state) => const Screen2c2(),
                          ),
                          GoRoute(
                            path: Screen2c3.routeName,
                            builder: (context, state) => const Screen2c3(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Screen 3 branch (Tabs)
          StatefulShellBranch(
            navigatorKey: _screen3NavKey,
            initialLocation: Screen3a.routeName,
            routes: [
              StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) {
                  return TabsLayout(
                    navigationShell: navigationShell,
                    tabs: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.business),
                        label: 'Business',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.school),
                        label: 'School',
                      ),
                    ],
                  );
                },
                branches: [
                  StatefulShellBranch(
                    navigatorKey: _screen3aNavKey,
                    initialLocation: Screen3a.routeName,
                    routes: [
                      GoRoute(
                        path: Screen3a.routeName,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: Screen3a(),
                        ),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    navigatorKey: _screen3bNavKey,
                    initialLocation: Screen3b.routeName,
                    routes: [
                      GoRoute(
                        path: Screen3b.routeName,
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: Screen3b(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    // Authentication flow
    // Redirects to login if not logged in, else stays in the page unless
    // the user is in the login or register page, in which case it redirects
    // to the home page
    redirect: (BuildContext context, GoRouterState state) {
      final loggedIn = userProfile.value != null;
      final loggingIn = state.matchedLocation == LoginScreen.routeName ||
          state.matchedLocation == RegisterScreen.routeName;

      if (!loggedIn) {
        if (loggingIn) {
          return null;
        } else {
          /// TODO Mostrar toast/snackbar/aviso - Hay error al no
          /// encontrar un Scaffold en los ancestros
          // Toast.show('Debes iniciar sesión para acceder a esta página');
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Debes iniciar sesión para acceder a esta página'),
          //   ),
          // );

          return '/login';
        }
      }

      if (loggingIn) {
        /// TODO Mostrar toast/snackbar/aviso - Hay error al no
        /// encontrar un Scaffold en los ancestros
        // Toast.show('Ya has iniciado sesión');
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Ya has iniciado sesión'),
        //   ),
        // );

        return '/';
      }

      return null;
    },
  );
}
