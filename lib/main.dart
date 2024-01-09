import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod101/providers/router_provider.dart';
import 'package:riverpod101/utils/consts.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

// Desacoplamos _App como ConsumerWidget para acceder al routerProvider
class _App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primary,
          secondary: primary,
        ),
        canvasColor: Colors.white,
      ),
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      // [GoRouter] provided routing information
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

void main() {
  // [ProviderScope] Top level provider required by Riverpod
  runApp(ProviderScope(child: _App()));
}
