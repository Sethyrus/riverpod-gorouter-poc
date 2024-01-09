import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

@riverpod
GoRouter router(RouterRef ref) {
  final AsyncValue<UserProfile?> userProfile = ref.watch(authProvider);

  return GoRouter(
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
                            pageBuilder: (context, state) =>
                                const NoTransitionPage(
                              child: Screen2a1(),
                            ),
                          ),
                          GoRoute(
                            path: Screen2a2.routeName,
                            pageBuilder: (context, state) =>
                                const NoTransitionPage(
                              child: Screen2a2(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  StatefulShellBranch(
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
                            pageBuilder: (context, state) =>
                                const NoTransitionPage(
                              child: Screen2c1(),
                            ),
                          ),
                          GoRoute(
                            path: Screen2c2.routeName,
                            pageBuilder: (context, state) =>
                                const NoTransitionPage(
                              child: Screen2c2(),
                            ),
                          ),
                          GoRoute(
                            path: Screen2c3.routeName,
                            pageBuilder: (context, state) =>
                                const NoTransitionPage(
                              child: Screen2c3(),
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
          // Screen 3 branch (Tabs)
          StatefulShellBranch(
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
    redirect: (BuildContext context, GoRouterState state) {
      final loggedIn = userProfile.value != null;
      final loggingIn = state.matchedLocation == LoginScreen.routeName ||
          state.matchedLocation == RegisterScreen.routeName;

      if (!loggedIn) return loggingIn ? null : '/login';

      if (loggingIn) return '/';

      return null;
    },
  );
}
