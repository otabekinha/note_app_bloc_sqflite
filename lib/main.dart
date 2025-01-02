import 'package:flutter/material.dart';
import 'package:note_app/core/navigation/app_router.dart';
import 'package:note_app/core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Note App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightThemeMode,
      darkTheme: AppTheme.darkThemeMode,
      routerConfig: goRouter,
    );
  }
}
