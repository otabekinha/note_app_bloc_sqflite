import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_textfield.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

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
            onPressed: () {},
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                controller: titleController,
                hintText: 'Title',
                hintstyle: TextStyle(
                  fontSize: 24,
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
