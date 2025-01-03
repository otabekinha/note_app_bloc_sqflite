import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/src/features/core/routes/app_router.dart';
import 'package:note_app/src/features/core/theme/app_pallete.dart';
import 'package:note_app/src/features/notes/presentation/cubit/note_cubit.dart';
import 'package:note_app/src/features/notes/presentation/cubit/note_state.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
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
                  return ListView.builder(
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {
                            context.goNamed(
                              AppRoute.addNotePage.name,
                              extra: state.notes[index],
                            );
                          },
                          title: Text(state.notes[index].title),
                          subtitle: Text(state.notes[index].description),
                        ),
                      );
                    },
                  );
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
