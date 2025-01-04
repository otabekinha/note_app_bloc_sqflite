import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/features/core/routes/app_router.dart';
import 'package:note_app/src/features/core/theme/theme.dart';
import 'package:note_app/src/features/notes/data/data_sources/note_local_data_source.dart';
import 'package:note_app/src/features/notes/note_injections.dart';
import 'package:note_app/src/features/notes/presentation/cubit/note_cubit.dart';
import 'package:note_app/src/features/notes/presentation/cubit/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  initNoteModule();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteCubit(
            noteLocalDataSource: NoteLocalDataSource(),
          )..fetchAllNotes(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(sharedPreferences: sharedPreferences)
            ..loadThemePreference(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            title: 'Note App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightThemeMode,
            themeMode: _getThemeMode(themeState),
            darkTheme: AppTheme.darkThemeMode,
            routerConfig: goRouter,
          );
        },
      ),
    );
  }

  ThemeMode _getThemeMode(ThemeState themeState) {
    switch (themeState) {
      case ThemeState.light:
        return ThemeMode.light;
      case ThemeState.dark:
        return ThemeMode.dark;
      case ThemeState.system:
      return ThemeMode.system;
    }
  }
}
