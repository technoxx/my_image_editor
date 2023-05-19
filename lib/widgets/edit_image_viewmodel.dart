import 'package:flutter/material.dart';
import 'package:my_image_editor/models/text_info.dart';
import 'package:my_image_editor/screens/edit_image_screen.dart';
import 'package:my_image_editor/widgets/default_button.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  List<TextInfo> texts = [];
  int currentIndex = 0;
  setCurrentIndex(BuildContext context, index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Selected for styling',
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  myAddNewText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
            text: textEditingController.text,
            left: 0,
            top: 0,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            textAlign: TextAlign.left),
      );
      Navigator.of(context).pop();
    });
  }

//for text typing box
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
              onPressed: () => myAddNewText(context),
              child: const Text('Add text'),
              color: Colors.pink,
              textcolor: Colors.black),
        ],
      ),
    );
  }
}
