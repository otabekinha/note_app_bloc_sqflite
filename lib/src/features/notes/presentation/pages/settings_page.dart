import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/features/core/theme/app_pallete.dart';
import 'package:note_app/src/features/notes/presentation/cubit/theme_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ThemeCubit>().loadThemePreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Icon(
              Icons.note_alt,
              size: 100,
              color: AppPallete.primaryColor,
            ),
            Text(
              'Note App',
              textAlign: TextAlign.center,
            ),
            Text(
              'Theme mode',
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return SegmentedButton<ThemeState>(
                  segments: [
                    ButtonSegment<ThemeState>(
                      value: ThemeState.system,
                      label: Text('System'),
                    ),
                    ButtonSegment<ThemeState>(
                      value: ThemeState.light,
                      label: Text('Light'),
                    ),
                    ButtonSegment<ThemeState>(
                      value: ThemeState.dark,
                      label: Text('Dark'),
                    ),
                  ],

                  selected: {state}, // Passing a Set of ThemeState
                  onSelectionChanged: (Set<ThemeState> selected) {
                    context.read<ThemeCubit>().setThemeMode(selected.first);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
