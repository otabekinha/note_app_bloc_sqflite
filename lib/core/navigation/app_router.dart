import 'package:go_router/go_router.dart';
import 'package:note_app/pages/add_note_page.dart';
import 'package:note_app/pages/note_page.dart';

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
          builder: (context, state) => AddNotePage(),
        ),
      ],
    ),
  ],
);
