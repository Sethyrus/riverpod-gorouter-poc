import 'package:flutter/widgets.dart';
import 'package:flutter_kit/widgets/layout.dart';
import 'package:flutter_kit/widgets/tx.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      child: Center(
        child: Tx('Hello World'),
      ),
    );
  }
}
