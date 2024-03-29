import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/tx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod101/screens/home_screen.dart';
import 'package:riverpod101/screens/register_screen.dart';
import 'package:riverpod101/providers/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Login'),
            ElevatedButton(
              onPressed: () {
                ref.read(authProvider.notifier).login('Seth', '');
              },
              child: const Tx('Iniciar sesión'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(RegisterScreen.routeName);
              },
              child: const Tx('Ir al registro'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go(HomeScreen.routeName);
              },
              child: const Tx('Ir a la home'),
            ),
          ],
        ),
      ),
    );
  }
}
