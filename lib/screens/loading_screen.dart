import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  static const String routeName = '/loading';

  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
