import 'package:go_router/go_router.dart';
import 'package:note_app/src/features/notes/data/models/note_model.dart';
import 'package:note_app/src/features/notes/presentation/pages/add_note_page.dart';
import 'package:note_app/src/features/notes/presentation/pages/note_page.dart';

enum AppRoute {
  notePage,
  addNotePage,
}

final GoRouter goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.notePage.name,
      builder: (context, state) => NotePage(),
      routes: [
        GoRoute(
          path: '/add-note-page',
          name: AppRoute.addNotePage.name,
          builder: (context, state) {
            final noteToEdit = state.extra as NoteModel?;
            return AddNotePage(noteToEdit: noteToEdit);
          },
        ),
      ],
    ),
  ],
);
