import 'package:flutter/material.dart';
import 'package:my_image_editor/screens/edit_image_screen.dart';
import 'package:my_image_editor/widgets/default_button.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  TextEditingController textEditingController = TextEditingController();
  myaddNewDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add new text'),
        content: TextField(
          controller: textEditingController,
          maxLines: 5,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.edit),
            filled: true,
            hintText: 'Your text here...',
          ),
        ),
        actions: <Widget>[
          DefaultButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Back'),
            color: Colors.pink,
            textcolor: Colors.black,
          ),
          DefaultButton(
              onPressed: () {},
              child: const Text('Add text'),
              color: Colors.pink,
              textcolor: Colors.black),
        ],
      ),
    );
  }
}
