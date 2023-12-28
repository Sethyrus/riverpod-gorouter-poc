import 'package:flutter/material.dart';
import 'package:riverpod101/utils/consts.dart';
import 'package:riverpod101/utils/router.dart';

void main() {
  runApp(
    MaterialApp.router(
      title: appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primary,
          secondary: primary,
        ),
        canvasColor: Colors.white,
      ),
      routerConfig: router,
    ),
  );
}
