import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_image_editor/widgets/edit_image_viewmodel.dart';

class EditImageScreen extends StatefulWidget {
  final String myselectedImage;
  const EditImageScreen({Key? key, required this.myselectedImage})
      : super(key: key);

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(widget.myselectedImage)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myaddNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add new text',
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      ),
    );
  }
}
