import 'dart:io';

import 'package:flutter/material.dart';

class EditImageScreen extends StatefulWidget {
  final String myselectedImage;
  const EditImageScreen({Key? key, required this.myselectedImage})
      : super(key: key);

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(widget.myselectedImage)),
    );
  }
}
