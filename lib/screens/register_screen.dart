import 'package:flutter/material.dart';
import 'package:flutter_kit/widgets/layout.dart';
import 'package:flutter_kit/widgets/tx.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod101/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Register'),
            ElevatedButton(
              onPressed: () {
                context.go(LoginScreen.routeName);
                // context.go(LoginScreen.routeName);
              },
              child: const Tx('Ir al login'),
            )
          ],
        ),
      ),
    );
  }
}
