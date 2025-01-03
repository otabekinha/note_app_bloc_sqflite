import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/features/core/routes/app_router.dart';
import 'package:note_app/src/features/core/theme/theme.dart';
import 'package:note_app/src/features/notes/data/data_sources/note_local_data_source.dart';
import 'package:note_app/src/features/notes/note_injections.dart';
import 'package:note_app/src/features/notes/presentation/cubit/note_cubit.dart';

void main() {
  initNoteModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(
        noteLocalDataSource: NoteLocalDataSource(),
      )..fetchAllNotes(),
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
