import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/src/features/core/routes/app_router.dart';
import 'package:note_app/src/features/core/theme/app_pallete.dart';
import 'package:note_app/src/features/notes/presentation/cubit/note_cubit.dart';
import 'package:note_app/src/features/notes/presentation/cubit/note_state.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(AppRoute.settingsPage.name);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.0,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text(
              'Your Notes',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppPallete.primaryColor,
                fontFamily: 'ZillaSlab',
              ),
            ),
            Expanded(child: BlocBuilder<NoteCubit, NoteState>(
              builder: (context, state) {
                if (state is NoteLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is NoteLoaded) {
                  if (state.notes.isEmpty) {
                    return Center(
                      child: Text(
                        'No notes available',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    );
                  } else {
                     final reversedNotes = state.notes.reversed.toList();
                    return ListView.builder(
                       itemCount: reversedNotes.length,
                      itemBuilder: (context, index) {
                        final note = reversedNotes[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Dismissible(
                            key: ValueKey(note.id),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              final deletedNote = state.notes[index];
                              context
                                  .read<NoteCubit>()
                                  .deleteNote(deletedNote.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Item deleted'),
                                  duration: const Duration(seconds: 3),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                            background: Container(
                              alignment: Alignment.centerRight,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.red,
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                            child: Card(
                              // elevation: 6,
                              // shadowColor: Colors.blue.shade300,
                              surfaceTintColor: Colors.transparent,
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 15,
                                ),
                                onTap: () {
                                  context.goNamed(
                                    AppRoute.addNotePage.name,
                                    extra: note,
                                  );
                                },
                                title: Text(
                                  note.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                subtitle: Text(
                                  note.description,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                } else if (state is NoteError) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text('No notes available'));
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.goNamed(AppRoute.addNotePage.name);
        },
        icon: Icon(Icons.add),
        label: Text(
          'ADD NOTE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
