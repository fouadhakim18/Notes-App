import 'package:flutter/material.dart';
import 'package:note_app_workshop/constants/colors.dart';

import '../models/note.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  const EditScreen({super.key, this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.note != null) {
      _titleController = TextEditingController(text: widget.note!.title);
      _contentController = TextEditingController(text: widget.note!.content);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8F8F8),
          leading: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                padding: const EdgeInsets.all(0),
                icon: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: backgroundColors[0],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                )),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              widget.note != null ? "Edit Note" : "Add Note",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: backgroundColors[0]),
            ),
          ),
        ),
        backgroundColor: const Color(0xFFF8F8F8),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: SingleChildScrollView(
            child: Column(children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the title';
                          }
                          return null;
                        },
                        style:
                            const TextStyle(color: Colors.black, fontSize: 25),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Title',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 94, 94, 94),
                                fontSize: 30)),
                      ),
                      TextFormField(
                        controller: _contentController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the content';
                          }
                          return null;
                        },
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: null,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type something here',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )),
                      )
                    ],
                  )),
              SizedBox(
                height: 100,
              ),
              Image.asset("assets/add-note.png")
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.pop(
                  context, [_titleController.text, _contentController.text]);
            }
          },
          elevation: 10,
          backgroundColor: backgroundColors[0],
          child: Icon(
            Icons.save,
            size: 29,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
