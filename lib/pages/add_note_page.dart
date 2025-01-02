import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_textfield.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  NoteModel? _note;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _note = GoRouterState.of(context).extra as NoteModel?;
    if (_note != null) {
      titleController.text = _note!.title;
      contentController.text = _note!.description;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
            ),
            onPressed: () {
              final title = titleController.text.trim();
              final description = contentController.text.trim();

              if (title.isNotEmpty && description.isNotEmpty) {
                NoteModel note;

                if (_note != null) {
                  note = NoteModel(
                    id: _note!.id,
                    title: title,
                    description: description,
                  );
                  context.read<NoteCubit>().updateNote(note);
                } else {
                  note = NoteModel(
                    title: title,
                    description: description,
                  );
                  context.read<NoteCubit>().addNote(note);
                }

                Navigator.pop(context);
              } else {
                // ... (your error handling)
              }
            },
            icon: Icon(Icons.check),
            label: Text('SAVE'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              CustomTextfield(
                textFontStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                controller: titleController,
                hintText: 'Title',
                hintstyle: TextStyle(
                  fontSize: 28,
                ),
              ),
              CustomTextfield(
                textFontStyle: TextStyle(
                  fontSize: 16,
                ),
                controller: contentController,
                hintText: 'Content',
                hintstyle: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
