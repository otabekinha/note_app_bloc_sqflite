import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/core/navigation/app_router.dart';
import 'package:note_app/core/theme/theme.dart';
import 'package:note_app/cubit/note_cubit.dart';
import 'package:note_app/services/database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(
        databaseHelper: NoteDatabaseHelper(),
      )..loadNotes(),
      child: MaterialApp.router(
        title: 'Note App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeMode,
        darkTheme: AppTheme.darkThemeMode,
        routerConfig: goRouter,
      ),
    );
  }
}
