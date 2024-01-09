import 'package:flutter/widgets.dart';

class Screen1 extends StatelessWidget {
  static const String routeName = '/screen1';

  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Screen 1'),
    );
  }
}
