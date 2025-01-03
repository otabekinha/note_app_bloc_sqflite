import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/src/features/notes/data/models/note_model.dart';
import 'package:note_app/src/features/notes/presentation/cubit/note_cubit.dart';
import 'package:note_app/src/features/notes/presentation/widgets/custom_textfield.dart';

class AddNotePage extends StatefulWidget {
  final NoteModel? noteToEdit;
  const AddNotePage({super.key, this.noteToEdit});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Check if noteToEdit is provided and populate controllers if it exists
    if (widget.noteToEdit != null) {
      titleController.text = widget.noteToEdit!.title;
      contentController.text = widget.noteToEdit!.description;
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
              final content = contentController.text.trim();

              if (title.isNotEmpty && content.isNotEmpty) {
                // Create the note model
                final note = NoteModel(
                  id: widget.noteToEdit?.id ?? DateTime.now().toString(),
                  title: title,
                  description: content,
                );

                if (widget.noteToEdit != null) {
                  // If editing an existing note, update it
                  context.read<NoteCubit>().updateNote(note);
                } else {
                  // If adding a new note
                  context.read<NoteCubit>().addNote(note);
                }

                Navigator.pop(context);
              } else {
                // You can show an error message if fields are empty
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Title and content cannot be empty')),
                );
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
